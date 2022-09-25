CREATE TYPE "event_type" AS ENUM (
  'booked_consultation',
  'canceled_consultation'
);

CREATE TYPE "appoitment_status" AS ENUM (
  'scheduled',
  'finished',
  'rescheduled',
  'canceled'
);

CREATE TYPE "notification_type" AS ENUM (
  'booking_confirmation',
  'booking_reschedule'
);

CREATE TABLE "events" (
  "id" SERIAL UNIQUE,
  "provider_id" UUID NOT NULL,
  "client_id" UUID NOT NULL,
  "type" event_type NOT NULL,
  "event_details" JSON NOT NULL,
  "created_at" timestamp DEFAULT (now())
);

CREATE TABLE "appointments" (
  "id" SERIAL UNIQUE,
  "appointment_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "chat_id" UUID NOT NULL,
  "time" timestamp NOT NULL,
  "status" appoitment_status NOT NULL,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT NULL
);

CREATE TABLE "user_to_appointments" (
  "id" SERIAL UNIQUE,
  "client_id" UUID NOT NULL,
  "provider_id" UUID NOT NULL,
  "appointment_id" UUID NOT NULL,
  "created_at" timestamp DEFAULT (now())
);

CREATE TABLE "chat" (
  "id" SERIAL UNIQUE,
  "chat_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "messages" JSON,
  "date" timestamp NOT NULL,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT NULL,
  "deleted_at" timestamp DEFAULT NULL
);

CREATE TABLE "notifications" (
  "id" SERIAL UNIQUE,
  "notification_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "user_id" UUID NOT NULL,
  "type" notification_type NOT NULL,
  "content" JSON,
  "is_read" Boolean DEFAULT false,
  "created_at" timestamp DEFAULT (now())
);

ALTER TABLE "appointments" ADD FOREIGN KEY ("chat_id") REFERENCES "chat" ("chat_id");

ALTER TABLE "user_to_appointments" ADD FOREIGN KEY ("appointment_id") REFERENCES "appointments" ("appointment_id");
