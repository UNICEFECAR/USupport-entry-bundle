CREATE TYPE "notification_type" AS ENUM (
  /**
   * Client: confirm booked consultation
   * Provider: notify about booked consultation
   */
  'consultation_confirmation',

  /**
   * Client: confirm consultation rescheduling
   * Provider: notify about consultation rescheduling
   */
  'consultation_reschedule',

  /**
   * Client: confirm consultation cancellation
   * Provider: notify about consultation cancellation
   */
  'consultation_cancellation',

  /**
   * Client: notify about consultation start
   * Provider: notify about consultation start
   */
  'consultation_reminder',

  /**
   * Client: notify about consultation suggestion
   * Provider: confirm consultation suggestion
   */
  'consultation_suggestion',

  /**
   * Client: confirm booked consultation suggestion
   * Provider: notify about booked consultation suggestion
   */
  'consultation_suggestion_confirmation',

  /**
   * Provider: remind a provider to add more availability slots to their schedule
   */
  'add_new_availability',

  /**
   * Provider: overview of any activites that happened in the past 1 week
   */
  'weekly_report',

  /**
   * Provider: overview of any activites that happened in the past 1 month
   */
  'monthly_report',
);

CREATE TYPE "consultation_status" AS ENUM (
  'pending',
  'scheduled',
  'finished',
  'rescheduled',
  'canceled'
);

CREATE TABLE "consultation" (
  "id" SERIAL UNIQUE,
  "consultation_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "client_detail_id" UUID NOT NULL,
  "provider_detail_id" UUID NOT NULL,
  "chat_id" UUID,
  "time" timestamp NOT NULL,
  "status" consultation_status NOT NULL,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT NULL
);

CREATE TABLE "chat" (
  "id" SERIAL UNIQUE,
  "chat_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "client_detail_id" UUID NOT NULL,
  "provider_detail_id" UUID NOT NULL,
  "messages" JSON,
  "date" timestamp NOT NULL,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT NULL,
  "deleted_at" timestamp DEFAULT NULL
);

CREATE TABLE "notification" (
  "id" SERIAL UNIQUE,
  "notification_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "user_id" UUID NOT NULL,
  "type" notification_type NOT NULL,
  "content" JSON,
  "is_read" Boolean DEFAULT false,
  "created_at" timestamp DEFAULT (now())
);

ALTER TABLE "consultation" ADD FOREIGN KEY ("chat_id") REFERENCES "chat" ("chat_id");
