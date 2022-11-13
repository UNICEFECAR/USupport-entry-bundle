CREATE TYPE "admin_roles" AS ENUM (
  'global',
  'regional',
  'country'
);

CREATE TYPE "service_type" AS ENUM (
  'text_audio_video_consultation'
);

CREATE TABLE "admin" (
  "id" SERIAL UNIQUE,
  "admin_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "name" varchar NOT NULL,
  "surname" varchar NOT NULL,
  "phone_prefix" varchar,
  "phone" varchar,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL,
  "role" admin_roles NOT NULL,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT NULL
);

CREATE TABLE "region" (
  "id" SERIAL UNIQUE,
  "region_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "name" varchar NOT NULL,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT NULL
);

CREATE TABLE "country" (
  "id" SERIAL UNIQUE,
  "country_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "region_id" UUID,
  "name" varchar NOT NULL,
  "alpha2" varchar NOT NULL,
  "alpha3" varchar NOT NULL,
  "num3" varchar,
  "faq_website_ids" varchar[] DEFAULT array[]::varchar[],
  "faq_client_ids" varchar[] DEFAULT array[]::varchar[],
  "faq_provider_ids" varchar[] DEFAULT array[]::varchar[],
  "sos_center_ids" varchar[] DEFAULT array[]::varchar[],
  "article_ids" varchar[] DEFAULT array[]::varchar[],
  "is_active" Boolean DEFAULT false,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT NULL
);

CREATE TABLE "admin_region_links" (
  "id" SERIAL UNIQUE,
  "admin_id" UUID NOT NULL,
  "region_id" UUID NOT NULL,
  "created_at" timestamp DEFAULT (now())
);

CREATE TABLE "admin_country_links" (
  "id" SERIAL UNIQUE,
  "admin_id" UUID NOT NULL,
  "country_id" UUID NOT NULL,
  "created_at" timestamp DEFAULT (now())
);

CREATE TABLE "service" (
  "id" SERIAL UNIQUE,
  "service_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "type" service_type NOT NULL,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT NULL
);

CREATE TABLE "service_client_provider_links" (
  "id" SERIAL UNIQUE,
  "client_details_id" UUID NOT NULL,
  "provider_details_id" UUID NOT NULL,
  "service_id" UUID NOT NULL,
  "duration" int,
  "created_at" timestamp DEFAULT (now())
);

CREATE TABLE "language" (
  "id" SERIAL UNIQUE,
  "language_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "name" varchar NOT NULL,
  "alpha2" varchar NOT NULL,
  "is_active" Boolean DEFAULT false,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT NULL
);


ALTER TABLE "country" ADD FOREIGN KEY ("region_id") REFERENCES "region" ("region_id");

ALTER TABLE "admin_region_links" ADD FOREIGN KEY ("admin_id") REFERENCES "admin" ("admin_id");

ALTER TABLE "admin_region_links" ADD FOREIGN KEY ("region_id") REFERENCES "region" ("region_id");

ALTER TABLE "admin_country_links"
 ADD FOREIGN KEY ("admin_id") REFERENCES "admin" ("admin_id");

ALTER TABLE "admin_country_links" ADD FOREIGN KEY ("country_id") REFERENCES "country" ("country_id");

ALTER TABLE "service_client_provider_links" ADD FOREIGN KEY ("service_id") REFERENCES "service" ("service_id");

-- Triggers --

CREATE OR REPLACE FUNCTION update_updated_at_column() 
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$ language 'plpgsql';

CREATE TRIGGER update_admin_updated_at BEFORE UPDATE ON "admin" FOR EACH ROW EXECUTE PROCEDURE  update_updated_at_column();
CREATE TRIGGER update_region_updated_at BEFORE UPDATE ON region FOR EACH ROW EXECUTE PROCEDURE  update_updated_at_column();
CREATE TRIGGER update_country_updated_at BEFORE UPDATE ON country FOR EACH ROW EXECUTE PROCEDURE  update_updated_at_column();
CREATE TRIGGER update_service_updated_at BEFORE UPDATE ON "service" FOR EACH ROW EXECUTE PROCEDURE  update_updated_at_column();
CREATE TRIGGER update_language_updated_at BEFORE UPDATE ON "language" FOR EACH ROW EXECUTE PROCEDURE  update_updated_at_column();
