CREATE TYPE "user_type" AS ENUM (
  'client',
  'provider'
);

CREATE TYPE "specialization_type" AS ENUM (
  'anxiety',
  'trauma'
);

CREATE TYPE "login_status" AS ENUM (
  'successful',
  'failed'
);

CREATE TABLE "user" (
  "id" SERIAL UNIQUE,
  "user_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "country_id" UUID NOT NULL,
  "type" user_type NOT NULL,
  "client_detail_id" UUID NOT NULL,
  "provider_detail_id" UUID NOT NULL,
  "password" varchar NOT NULL,
  "notification_preference_id" UUID NOT NULL,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT NULL
);

CREATE TABLE "provider_detail" (
  "id" SERIAL UNIQUE,
  "provider_detail_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "name" varchar NOT NULL,
  "surname" varchar NOT NULL,
  "email" varchar NOT NULL,
  "phone_prefix" varchar,
  "phone" varchar,
  "image" varchar,
  "address" varchar,
  "video" varchar,
  "professional_association" varchar,
  "specialization" UUID,
  "start_practicing_year" int,
  "education" JSON,
  "sex" varchar,
  "introduction" varchar,
  "consultation_price" int,
  "description" varchar,
  "work_with" Array,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT NULL
);

CREATE TABLE "client_detail" (
  "id" SERIAL UNIQUE,
  "client_detail_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "name" varchar NOT NULL,
  "surname" varchar NOT NULL,
  "prefered_name" varchar NOT NULL,
  "email" varchar NOT NULL,
  "phone_prefix" varchar,
  "phone" varchar,
  "image" varchar,
  "sex" varchar,
  "push_token" varchar,
  "year_of_birth" int,
  "access_token" varchar,
  "stripe_customer_id" varchar,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT NULL
);

CREATE TABLE "specialization" (
  "id" SERIAL UNIQUE,
  "specialization_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "type" specialization_type NOT NULL
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
  "slots" Array,
  "start_date" timestamp NOT NULL,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT NULL
);

CREATE TABLE "notification_preference" (
  "id" SERIAL UNIQUE,
  "notification_preference_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "email" boolean DEFAULT true,
  "online" boolean DEFAULT true,
  "push" boolean DEFAULT true,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT NULL
);

CREATE TABLE "password_reset" (
  "id" SERIAL UNIQUE,
  "pass_reset_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "user_id" UUID NOT NULL,
  "reset_token" varcahr NOT NULL,
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

ALTER TABLE "user" ADD FOREIGN KEY ("client_detail_id") REFERENCES "client_detail" ("client_detail_id");

ALTER TABLE "user" ADD FOREIGN KEY ("provider_detail_id") REFERENCES "provider_detail" ("provider_detail_id");

ALTER TABLE "user" ADD FOREIGN KEY ("notification_preference_id") REFERENCES "notification_preference" ("notification_preference_id");

ALTER TABLE "specialization" ADD FOREIGN KEY ("specialization_id") REFERENCES "provider_detail" ("specialization");

ALTER TABLE "provider_detail_language_links" ADD FOREIGN KEY ("provider_detail_id") REFERENCES "provider_detail" ("provider_detail_id");

ALTER TABLE "availability" ADD FOREIGN KEY ("provider_detail_id") REFERENCES "provider_detail" ("provider_detail_id");

ALTER TABLE "password_reset" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("user_id");

ALTER TABLE "login_attempt" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("user_id");

ALTER TABLE "refresh_token" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("user_id");
