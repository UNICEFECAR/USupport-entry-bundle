CREATE TYPE "user_type" AS ENUM ('client', 'provider');

CREATE TYPE "specializations_type" AS ENUM (
  'psychologist',
  'psychotherapist',
  'psychiatrist',
  'coach'
);

CREATE TYPE "sex_type" AS ENUM (
  'male',
  'female',
  'unspecified',
  'notMentioned'
);

CREATE TYPE "login_status" AS ENUM ('successful', 'failed');

CREATE TYPE "living_type" AS ENUM ('urban', 'rural');

CREATE TABLE "user" (
  "id" SERIAL UNIQUE,
  "user_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "country_id" UUID NOT NULL,
  "type" user_type NOT NULL,
  "client_detail_id" UUID,
  "provider_detail_id" UUID,
  "password" varchar NOT NULL,
  "notification_preference_id" UUID NOT NULL,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT NULL,
  "deleted_at" timestamp DEFAULT NULL
);

CREATE TABLE "provider_detail" (
  "id" SERIAL UNIQUE,
  "provider_detail_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "name" varchar NOT NULL,
  "patronym" varchar,
  "surname" varchar NOT NULL,
  "nickname" varchar,
  "email" varchar NOT NULL,
  "phone_prefix" varchar,
  "phone" varchar,
  "image" varchar DEFAULT 'default',
  "specializations" specializations_type [],
  "address" varchar,
  "education" varchar [],
  "sex" sex_type,
  "consultation_price" int,
  "description" varchar,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT NULL
);

CREATE TABLE "client_detail" (
  "id" SERIAL UNIQUE,
  "client_detail_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "name" varchar,
  "surname" varchar,
  "nickname" varchar NOT NULL,
  "email" varchar,
  "image" varchar DEFAULT 'default',
  "sex" sex_type,
  "push_token" varchar,
  "year_of_birth" int,
  "living_place" living_type,
  "data_processing" boolean DEFAULT false,
  "access_token" varchar,
  "stripe_customer_id" varchar,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT NULL
);

CREATE TABLE "provider_detail_work_with_links" (
  "id" SERIAL UNIQUE,
  "provider_detail_id" UUID NOT NULL,
  "work_with_id" UUID NOT NULL,
  "created_at" timestamp DEFAULT (now())
);

CREATE TABLE "work_with" (
  "id" SERIAL UNIQUE,
  "work_with_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "topic" varchar NOT NULL
);

CREATE TABLE "provider_detail_language_links" (
  "id" SERIAL UNIQUE,
  "provider_detail_id" UUID NOT NULL,
  "language_id" UUID NOT NULL,
  "created_at" timestamp DEFAULT (now())
);

CREATE TABLE "availability" (
  "id" SERIAL UNIQUE,
  "availability_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "provider_detail_id" UUID NOT NULL,
  "slots" varchar[],
  "start_date" timestamp NOT NULL,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT NULL
);

CREATE TABLE "notification_preference" (
  "id" SERIAL UNIQUE,
  "notification_preference_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "email" boolean DEFAULT true,
  "consultation_reminder" boolean DEFAULT true,
  "consultation_reminder_min" int DEFAULT 60,
  "in_platform" boolean DEFAULT true,
  "push" boolean DEFAULT true,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT NULL
);

CREATE TABLE "password_reset" (
  "id" SERIAL UNIQUE,
  "pass_reset_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "user_id" UUID NOT NULL,
  "reset_token" varchar NOT NULL,
  "used" boolean DEFAULT false,
  "expires_at" timestamp NOT NULL,
  "created_at" timestamp DEFAULT (now())
);

CREATE TABLE "login_attempt" (
  "id" SERIAL UNIQUE,
  "login_attempt_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "user_id" UUID NOT NULL,
  "ip_address" varchar NOT NULL,
  "location" varchar NOT NULL,
  "status" login_status NOT NULL,
  "created_at" timestamp DEFAULT (now())
);

CREATE TABLE "refresh_token" (
  "id" SERIAL UNIQUE,
  "refresh_token_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "user_id" UUID NOT NULL,
  "token" varchar NOT NULL,
  "used" boolean DEFAULT false,
  "expires_at" timestamp NOT NULL,
  "created_at" timestamp DEFAULT (now())
);

ALTER TABLE
  "user"
ADD
  FOREIGN KEY ("client_detail_id") REFERENCES "client_detail" ("client_detail_id");

ALTER TABLE
  "user"
ADD
  FOREIGN KEY ("provider_detail_id") REFERENCES "provider_detail" ("provider_detail_id");

ALTER TABLE
  "user"
ADD
  FOREIGN KEY ("notification_preference_id") REFERENCES "notification_preference" ("notification_preference_id");

ALTER TABLE
  "provider_detail_work_with_links"
ADD
  FOREIGN KEY ("provider_detail_id") REFERENCES "provider_detail" ("provider_detail_id");

ALTER TABLE
  "provider_detail_work_with_links"
ADD
  FOREIGN KEY ("work_with_id") REFERENCES "work_with" ("work_with_id");

ALTER TABLE
  "provider_detail_language_links"
ADD
  FOREIGN KEY ("provider_detail_id") REFERENCES "provider_detail" ("provider_detail_id");

ALTER TABLE
  "availability"
ADD
  FOREIGN KEY ("provider_detail_id") REFERENCES "provider_detail" ("provider_detail_id");

ALTER TABLE
  "password_reset"
ADD
  FOREIGN KEY ("user_id") REFERENCES "user" ("user_id");

ALTER TABLE
  "login_attempt"
ADD
  FOREIGN KEY ("user_id") REFERENCES "user" ("user_id");

ALTER TABLE
  "refresh_token"
ADD
  FOREIGN KEY ("user_id") REFERENCES "user" ("user_id");

-- Triggers --
CREATE
OR REPLACE FUNCTION update_updated_at_column() RETURNS TRIGGER AS $ $ BEGIN NEW.updated_at = now();

RETURN NEW;

END;

$ $ language 'plpgsql';

CREATE TRIGGER update_user_updated_at BEFORE
UPDATE
  ON "user" FOR EACH ROW EXECUTE PROCEDURE update_updated_at_column();

CREATE TRIGGER update_provider_detail_updated_at BEFORE
UPDATE
  ON provider_detail FOR EACH ROW EXECUTE PROCEDURE update_updated_at_column();

CREATE TRIGGER update_client_detail_updated_at BEFORE
UPDATE
  ON client_detail FOR EACH ROW EXECUTE PROCEDURE update_updated_at_column();

CREATE TRIGGER update_availability_updated_at BEFORE
UPDATE
  ON "availability" FOR EACH ROW EXECUTE PROCEDURE update_updated_at_column();

CREATE TRIGGER update_notification_preference_updated_at BEFORE
UPDATE
  ON notification_preference FOR EACH ROW EXECUTE PROCEDURE update_updated_at_column();