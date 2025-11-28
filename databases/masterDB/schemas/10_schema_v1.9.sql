CREATE TYPE action_type AS ENUM ('like','dislike','view','share','download');

-- 1. Main table
CREATE TABLE IF NOT EXISTS content_engagement_event (
  id                UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  content_type      content_type NOT NULL,
  content_id        INTEGER NOT NULL,
  client_detail_id  UUID,
  action            action_type NOT NULL,
  created_at        TIMESTAMPTZ NOT NULL DEFAULT now(),
  country_id        UUID,
  CONSTRAINT fk_country FOREIGN KEY (country_id) REFERENCES country (country_id)
);

-- 2. Temporary unique constraint for conflict handling
ALTER TABLE content_engagement_event
ADD CONSTRAINT uq_user_reaction_tmp UNIQUE (content_type, content_id, client_detail_id);

-- 3. Supporting indexes
CREATE INDEX IF NOT EXISTS idx_ct_id_time
  ON content_engagement_event (content_type, content_id, created_at);

CREATE INDEX IF NOT EXISTS idx_views_ct_id_time
  ON content_engagement_event (content_type, content_id, created_at)
  WHERE action = 'view';

CREATE INDEX IF NOT EXISTS idx_created_at
  ON content_engagement_event (created_at);

-- 4. Migrate latest user reactions from content_rating
--    user_id -> client_detail_id
INSERT INTO content_engagement_event (content_type, content_id, client_detail_id, action, created_at)
SELECT
  r.content_type,
  r.content_id,
  r.user_id AS client_detail_id,
  CASE WHEN r.positive THEN 'like'::action_type ELSE 'dislike'::action_type END AS action,
  COALESCE(r.created_at::timestamptz, now()) AS created_at
FROM (
  SELECT DISTINCT ON (content_type, content_id, user_id)
         content_type, content_id, user_id, positive, created_at, id
  FROM content_rating
  WHERE user_id IS NOT NULL
  ORDER BY content_type, content_id, user_id, created_at DESC NULLS LAST, id DESC
) AS r
ON CONFLICT (content_type, content_id, client_detail_id)
DO UPDATE
SET action = EXCLUDED.action,
    created_at = now();

-- 5. Cleanup temporary constraint
ALTER TABLE content_engagement_event
DROP CONSTRAINT IF EXISTS uq_user_reaction_tmp;

-- 6. Final partial unique index
CREATE UNIQUE INDEX IF NOT EXISTS uq_user_reaction
  ON content_engagement_event (content_type, content_id, client_detail_id)
  WHERE action IN ('like','dislike') AND client_detail_id IS NOT NULL;


ALTER TABLE "country" ADD COLUMN has_normal_slots boolean DEFAULT false;