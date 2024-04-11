ALTER TABLE "login_attempt" ADD COLUMN "start_cooldown" BOOLEAN NOT NULL DEFAULT FALSE;

CREATE TABLE "jwt_blacklist" (
    "id" SERIAL PRIMARY KEY,
    "token" TEXT NOT NULL,
    "created_at" TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE "user" ADD COLUMN last_login timestamp DEFAULT NOW();

CREATE TABLE "platform_access" (
    "id" SERIAL PRIMARY KEY,
    "user_id" UUID,
    "ip_address" VARCHAR NOT NULL,
    "platform" VARCHAR NOT NULL,
    "created_at" TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "provider_rating" (
    "id" SERIAL UNIQUE,
    "provider_rating_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
    "provider_detail_id" UUID NOT NULL,
    "rating" int NOT NULL,
    "comment" varchar,
    "created_at" timestamp DEFAULT (now())
);