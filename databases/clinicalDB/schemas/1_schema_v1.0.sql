CREATE TYPE "notification_type" AS ENUM (
  'consultation_confirmation',
  'consultation_reschedule',
  'consultation_cancellation',
  'consultation_reminder',
  'consultation_suggestion',
  'consultation_suggestion_confirmation',
  'add_new_availability',
  'weekly_report',
  'monthly_report'
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
  "updated_at" timestamp DEFAULT NULL
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

-- Triggers --

CREATE OR REPLACE FUNCTION update_updated_at_column() 
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$ language 'plpgsql';

CREATE TRIGGER update_consultation_updated_at BEFORE UPDATE ON consultation FOR EACH ROW EXECUTE PROCEDURE  update_updated_at_column();
CREATE TRIGGER update_chat_updated_at BEFORE UPDATE ON chat FOR EACH ROW EXECUTE PROCEDURE  update_updated_at_column();
