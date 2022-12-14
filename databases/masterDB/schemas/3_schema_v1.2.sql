CREATE TABLE "refresh_token" (
  "id" SERIAL UNIQUE,
  "refresh_token_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "admin_id" UUID NOT NULL,
  "token" varchar NOT NULL,
  "used" boolean DEFAULT false,
  "expires_at" timestamp NOT NULL,
  "created_at" timestamp DEFAULT (now())
);

CREATE TABLE "password_reset" (
  "id" SERIAL UNIQUE,
  "pass_reset_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "admin_id" UUID NOT NULL,
  "reset_token" varchar NOT NULL,
  "used" boolean DEFAULT false,
  "expires_at" timestamp NOT NULL,
  "created_at" timestamp DEFAULT (now())
);

ALTER TABLE "refresh_token" ADD FOREIGN KEY ("admin_id") REFERENCES "admin" ("admin_id");
ALTER TABLE "password_reset" ADD FOREIGN KEY ("admin_id") REFERENCES "admin" ("admin_id");

ALTER TABLE "country" ADD COLUMN "min_client_age" int DEFAULT 16;
ALTER TABLE "country" ADD COLUMN "max_client_age" int DEFAULT 24;

ALTER TABLE "admin" ADD COLUMN "is_active" Boolean DEFAULT false;
ALTER TABLE "admin" ADD COLUMN "deleted_at" timestamp DEFAULT NULL;
ALTER TABLE "admin" DROP CONSTRAINT "admin_email_key";

ALTER TABLE "service_client_provider_links" RENAME COLUMN "client_details_id" TO "client_detail_id";
ALTER TABLE "service_client_provider_links" RENAME COLUMN "provider_details_id" TO "provider_detail_id";