CREATE TABLE "mood_tracker" (
    "id" SERIAL UNIQUE,
    "mood_tracker_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
    "client_detail_id" UUID NOT NULL,
    "mood" varchar NOT NULL,
    "comment" varchar,
    "time" timestamptz NOT NULL,
    "created_at" timestamp DEFAULT (now())
);
