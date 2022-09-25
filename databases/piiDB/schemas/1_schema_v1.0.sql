CREATE TYPE "user_type" AS ENUM (
  'client',
  'provider'
);

CREATE TYPE "login_status" AS ENUM (
  'successful',
  'failed'
);

CREATE TABLE "users" (
  "id" SERIAL UNIQUE,
  "user_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "country_id" UUID NOT NULL,
  "type" user_type NOT NULL,
  "client_details_id" UUID NOT NULL,
  "provider_details_id" UUID NOT NULL,
  "name" varchar NOT NULL,
  "surname" varchar NOT NULL,
  "phone" varchar,
  "password" varchar NOT NULL,
  "image" varchar,
  "notifications_preferences_id" UUID NOT NULL,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT NULL
);

CREATE TABLE "provider_details" (
  "id" SERIAL UNIQUE,
  "provider_details_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "address" varchar,
  "video" varchar,
  "profesional_association" varchar,
  "specialization" Array,
  "years_of_experience" int,
  "education" JSON,
  "gender" varchar,
  "introduction" varchar,
  "consultation_price" int,
  "languages" Array,
  "description" varchar,
  "work_with" Array,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT NULL
);

CREATE TABLE "client_details" (
  "id" SERIAL UNIQUE,
  "client_details_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "push_token" varchar,
  "access_token" varchar,
  "stripe_customer_id" varchar,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT NULL
);

CREATE TABLE "availability" (
  "id" SERIAL UNIQUE,
  "availability_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "provider_user_id" UUID NOT NULL,
  "slots" Array,
  "start_date" timestamp NOT NULL,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT NULL
);

CREATE TABLE "notifications_preferences" (
  "id" SERIAL UNIQUE,
  "notifications_preferences_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "email" boolean DEFAULT true,
  "online" boolean DEFAULT true,
  "push" boolean DEFAULT true,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT NULL
);

CREATE TABLE "pass_resets" (
  "id" SERIAL UNIQUE,
  "pass_reset_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "user_id" UUID NOT NULL,
  "reset_token" varcahr NOT NULL,
  "expires_at" timestamp NOT NULL,
  "created_at" timestamp DEFAULT (now())
);

CREATE TABLE "login_attempts" (
  "id" SERIAL UNIQUE,
  "login_attempt_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "user_id" UUID NOT NULL,
  "ip_address" varchar NOT NULL,
  "location" varchar NOT NULL,
  "status" login_status NOT NULL,
  "created_at" timestamp DEFAULT (now())
);

CREATE TABLE "refresh_tokens" (
  "id" SERIAL UNIQUE,
  "refresh_token_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "user_id" UUID NOT NULL,
  "token" varchar NOT NULL,
  "used" boolean DEFAULT false,
  "expires_at" timestamp NOT NULL,
  "created_at" timestamp DEFAULT (now())
);

ALTER TABLE "users" ADD FOREIGN KEY ("client_details_id") REFERENCES "client_details" ("client_details_id");

ALTER TABLE "users" ADD FOREIGN KEY ("provider_details_id") REFERENCES "provider_details" ("provider_details_id");

ALTER TABLE "users" ADD FOREIGN KEY ("notifications_preferences_id") REFERENCES "notifications_preferences" ("notifications_preferences_id");

ALTER TABLE "availability" ADD FOREIGN KEY ("provider_user_id") REFERENCES "users" ("user_id");

ALTER TABLE "pass_resets" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("user_id");

ALTER TABLE "login_attempts" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("user_id");

ALTER TABLE "refresh_tokens" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("user_id");
