CREATE TABLE "client_category_interaction" (
  "id" SERIAL UNIQUE,
  "client_category_interaction_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "category_id" INTEGER NOT NULL,
  "media_type" TEXT NOT NULL CHECK (media_type IN ('article', 'video', 'podcast')),
  "media_id" INTEGER NOT NULL,
  "client_detail_id" UUID NOT NULL,
  "count" INTEGER NOT NULL DEFAULT 1,
  "tag_ids" INTEGER[],
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT (now()),
  UNIQUE(client_detail_id, category_id, media_type, media_id)
);