CREATE TYPE content_type AS ENUM (
'article',
'video',
'podcast'
);

CREATE TABLE "content_rating" (
    "id" SERIAL UNIQUE,
    "content_rating_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
    "content_type" content_type NOT NULL,
    "content_id" INTEGER NOT NULL,
    "user_id" UUID NOT NULL,
    "positive" BOOLEAN NOT NULL,
    "created_at" timestamp DEFAULT (now()),
	  "updated_at" timestamp DEFAULT NULL 
);

ALTER TABLE content_rating
ADD CONSTRAINT unique_user_content_rating
UNIQUE (user_id, content_type, content_id);

ALTER TABLE country ADD COLUMN "video_ids" varchar [] DEFAULT array [] :: varchar [];
ALTER TABLE country ADD COLUMN "podcast_ids" integer[] DEFAULT array[]::integer[];

ALTER TABLE country ADD COLUMN "videos_active" BOOLEAN DEFAULT TRUE;
ALTER TABLE country ADD COLUMN "podcasts_active" BOOLEAN DEFAULT TRUE;

-- Triggers --
CREATE
OR REPLACE FUNCTION update_updated_at_column() RETURNS TRIGGER AS $$ BEGIN NEW.updated_at = now();

RETURN NEW;

END;

$$ language 'plpgsql';

CREATE TRIGGER update_consultation_updated_at BEFORE
UPDATE
  ON content_rating FOR EACH ROW EXECUTE PROCEDURE update_updated_at_column();