CREATE TABLE "platform_suggestion" (
    "id" SERIAL UNIQUE,
    "platform_suggestion_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
    "client_detail_id" UUID NOT NULL,
    "suggestion" varchar NOT NULL,
    "type" varchar NOT NULL DEFAULT 'information-portal',
    "created_at" timestamp DEFAULT (now())
);

ALTER TABLE "platform_suggestion" ADD FOREIGN KEY ("client_detail_id") REFERENCES "client_detail" ("client_detail_id");

INSERT INTO "platform_suggestion" (
  platform_suggestion_id,
  client_detail_id,
  suggestion,
  type,
  created_at
)
SELECT
  information_portal_suggestion_id,   
  client_detail_id,
  suggestion,
  'information-portal',               
  created_at
FROM information_portal_suggestion;

ALTER TABLE client_detail ADD COLUMN has_checked_baseline_assessment BOOLEAN DEFAULT FALSE;

CREATE INDEX IF NOT EXISTS idx_user_active_clients
ON "user"(id) WHERE type = 'client' AND deleted_at IS NULL;

CREATE INDEX IF NOT EXISTS idx_platform_access_created_at
ON platform_access (created_at);

ALTER TABLE platform_access ADD COLUMN visitor_id UUID;
ALTER TABLE platform_access ALTER COLUMN ip_address DROP NOT NULL;
CREATE INDEX idx_user_client_detail_id ON "user" (client_detail_id);
CREATE INDEX idx_user_provider_detail_id ON "user" (provider_detail_id);
