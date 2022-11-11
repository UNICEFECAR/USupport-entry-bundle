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
  "updated_at" timestamp DEFAULT NULL,
  "deleted_at" timestamp DEFAULT NULL
);

CREATE TABLE "region" (
  "id" SERIAL UNIQUE,
  "region_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "name" varchar NOT NULL,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT NULL,
  "deleted_at" timestamp DEFAULT NULL
);

CREATE TABLE "country" (
  "id" SERIAL UNIQUE,
  "country_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "region_id" UUID,
  "name" varchar NOT NULL,
  "alpha2" varchar NOT NULL,
  "alpha3" varchar NOT NULL,
  "num3" varchar,
  "faq_website_ids" UUID[] DEFAULT array[]::UUID[],
  "faq_client_ids" UUID[] DEFAULT array[]::UUID[],
  "faq_provider_ids" UUID[] DEFAULT array[]::UUID[],
  "sos_center_ids" UUID[] DEFAULT array[]::UUID[],
  "article_ids" UUID[] DEFAULT array[]::UUID[],
  "is_active" Boolean DEFAULT false,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT NULL,
  "deleted_at" timestamp DEFAULT NULL
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
  "updated_at" timestamp DEFAULT NULL,
  "deleted_at" timestamp DEFAULT NULL
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
  "updated_at" timestamp DEFAULT NULL,
  "deleted_at" timestamp DEFAULT NULL
);


ALTER TABLE "country" ADD FOREIGN KEY ("region_id") REFERENCES "region" ("region_id");

ALTER TABLE "admin_region_links" ADD FOREIGN KEY ("admin_id") REFERENCES "admin" ("admin_id");

ALTER TABLE "admin_region_links" ADD FOREIGN KEY ("region_id") REFERENCES "region" ("region_id");

ALTER TABLE "admin_country_links" ADD FOREIGN KEY ("admin_id") REFERENCES "admin" ("admin_id");

ALTER TABLE "admin_country_links" ADD FOREIGN KEY ("country_id") REFERENCES "country" ("country_id");

ALTER TABLE "service_client_provider_links" ADD FOREIGN KEY ("service_id") REFERENCES "service" ("service_id");

-- Populate the database with some initial data --

-- region table --
INSERT INTO "region" ("name") VALUES ('ECARO');

-- country table --
INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Albania', 'AL', 'ALB', '008', false);
INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Armenia', 'AM', 'ARM', '051', false);
INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Azerbaijan', 'AZ', 'AZE', '031', false);
INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Belarus', 'BY', 'BLR', '112', false);
INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Bosnia and Herzegovina,', 'BA', 'BIH', '070', false);
INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Georgia', 'GE', 'GEO', '268', false);
INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Kazakhstan', 'KZ', 'KAZ', '398', true);
INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Kosovo', 'XK', 'XKX', null, false);
INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Kyrgyzstan', 'KG', 'KGZ', '417', true);
INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Macedonia', 'MK', 'MKD', '807', false);
INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Moldova', 'MD', 'MDA', '498', false);
INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Montenegro', 'ME', 'MNE', '499', false);
INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Russian Federation', 'RU', 'RUS', '643', false);
INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Serbia', 'RS', 'SRB', '688', false);
INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Tajikistan', 'TJ', 'TJK', '762', false);
INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Turkmenistan', 'TM', 'TKM', '795', false);
INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Ukraine', 'UA', 'UKR', '804', false);
INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Uzbekistan', 'UZ', 'UZB', '860', false);
INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Bulgaria', 'BG', 'BGR', '100', false);
INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Croatia', 'HR', 'HRV', '191', false);
INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Romania', 'RO', 'ROU', '642', false);
INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Slovenia', 'SI', 'SVN', '705', false);

-- language table --
INSERT INTO "language" ("name", "alpha2", "is_active") VALUES ('Albanian', 'sq', false);
INSERT INTO "language" ("name", "alpha2", "is_active") VALUES ('Armenian', 'hy', false);
INSERT INTO "language" ("name", "alpha2", "is_active") VALUES ('Azerbaijani', 'az', false);
INSERT INTO "language" ("name", "alpha2", "is_active") VALUES ('Belarusian', 'be', false);
INSERT INTO "language" ("name", "alpha2", "is_active") VALUES ('Bosnian', 'bs', false);
INSERT INTO "language" ("name", "alpha2", "is_active") VALUES ('Georgian','ka', false);
INSERT INTO "language" ("name", "alpha2", "is_active") VALUES ('Kazakh', 'kk', true);
INSERT INTO "language" ("name", "alpha2", "is_active") VALUES ('Kyrgyz', 'ky', false);
INSERT INTO "language" ("name", "alpha2", "is_active") VALUES ('Macedonian', 'mk', false);
INSERT INTO "language" ("name", "alpha2", "is_active") VALUES ('Russian', 'ru', true);
INSERT INTO "language" ("name", "alpha2", "is_active") VALUES ('Serbian', 'sr', false);
INSERT INTO "language" ("name", "alpha2", "is_active") VALUES ('Tajik', 'tg', false);
INSERT INTO "language" ("name", "alpha2", "is_active") VALUES ('Turkmen', 'tk', false);
INSERT INTO "language" ("name", "alpha2", "is_active") VALUES ('Ukrainian', 'uk', false);
INSERT INTO "language" ("name", "alpha2", "is_active") VALUES ('Uzbek', 'uz', false);
INSERT INTO "language" ("name", "alpha2", "is_active") VALUES ('Bulgarian', 'bg', false);
INSERT INTO "language" ("name", "alpha2", "is_active") VALUES ('Croatian', 'hr', false);
INSERT INTO "language" ("name", "alpha2", "is_active") VALUES ('Romanian', 'ro', false);
INSERT INTO "language" ("name", "alpha2", "is_active") VALUES ('Slovenian', 'sl', false);
INSERT INTO "language" ("name", "alpha2", "is_active") VALUES ('English', 'en', true);

-- service table --
INSERT INTO "service" ("type") VALUES ('text_audio_video_consultation');