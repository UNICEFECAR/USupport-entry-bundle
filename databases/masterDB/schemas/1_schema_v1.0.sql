CREATE TYPE "admin_roles" AS ENUM (
  'global',
  'regional',
  'country'
);

CREATE TYPE "service_type" AS ENUM (
  'text_audio_video_consultation'
);

CREATE TABLE "admins" (
  "id" SERIAL UNIQUE,
  "admin_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "name" varchar NOT NULL,
  "surname" varchar NOT NULL,
  "phone" varchar,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL,
  "role" admin_roles NOT NULL,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT NULL,
  "deleted_at" timestamp DEFAULT NULL
);

CREATE TABLE "regions" (
  "id" SERIAL UNIQUE,
  "region_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "name" varchar NOT NULL,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT NULL,
  "deleted_at" timestamp DEFAULT NULL
);

CREATE TABLE "countries" (
  "id" SERIAL UNIQUE,
  "country_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "region_id" UUID,
  "name" varchar NOT NULL,
  "dbs" varchar NOT NULL,
  "prefix" varchar NOT NULL,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT NULL,
  "deleted_at" timestamp DEFAULT NULL
);

CREATE TABLE "admins_to_regions" (
  "id" SERIAL UNIQUE,
  "admin_id" UUID NOT NULL,
  "region_id" UUID NOT NULL,
  "created_at" timestamp DEFAULT (now())
);

CREATE TABLE "admins_to_countries" (
  "id" SERIAL UNIQUE,
  "admin_id" UUID NOT NULL,
  "country_id" UUID NOT NULL,
  "created_at" timestamp DEFAULT (now())
);

CREATE TABLE "services" (
  "id" SERIAL UNIQUE,
  "service_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "type" service_type NOT NULL,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT NULL,
  "deleted_at" timestamp DEFAULT NULL
);

CREATE TABLE "service_log" (
  "id" SERIAL UNIQUE,
  "client_id" UUID NOT NULL,
  "provider_id" UUID NOT NULL,
  "service_id" UUID NOT NULL,
  "duration" int,
  "created_at" timestamp DEFAULT (now())
);

CREATE TABLE "languages" (
  "id" SERIAL UNIQUE,
  "language_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "language" varchar NOT NULL,
  "prefix" varchar NOT NULL,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT NULL,
  "deleted_at" timestamp DEFAULT NULL
);

CREATE TABLE "languages_to_country" (
  "id" SERIAL UNIQUE,
  "country_id" UUID NOT NULL,
  "language_id" UUID NOT NULL,
  "created_at" timestamp DEFAULT (now())
);

ALTER TABLE "countries" ADD FOREIGN KEY ("region_id") REFERENCES "regions" ("region_id");

ALTER TABLE "admins_to_regions" ADD FOREIGN KEY ("admin_id") REFERENCES "admins" ("admin_id");

ALTER TABLE "admins_to_regions" ADD FOREIGN KEY ("region_id") REFERENCES "regions" ("region_id");

ALTER TABLE "admins_to_countries" ADD FOREIGN KEY ("admin_id") REFERENCES "admins" ("admin_id");

ALTER TABLE "admins_to_countries" ADD FOREIGN KEY ("country_id") REFERENCES "countries" ("country_id");

ALTER TABLE "service_log" ADD FOREIGN KEY ("service_id") REFERENCES "services" ("service_id");

ALTER TABLE "languages_to_country" ADD FOREIGN KEY ("country_id") REFERENCES "countries" ("country_id");

ALTER TABLE "languages_to_country" ADD FOREIGN KEY ("language_id") REFERENCES "languages" ("language_id");
