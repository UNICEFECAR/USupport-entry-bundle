ALTER TYPE "consultation_status" ADD VALUE 'suggested';
ALTER TYPE "consultation_status" ADD VALUE 'timeout';
ALTER TYPE "consultation_status" ADD VALUE 'rejected';

ALTER TYPE "notification_type" RENAME VALUE 'consultation_confirmation' TO 'consultation_booking';
ALTER TYPE "notification_type" ADD VALUE 'consultation_cancellation_provider';
ALTER TYPE "notification_type" RENAME VALUE 'consultation_reminder' TO 'consultation_remind_start';
ALTER TYPE "notification_type" RENAME VALUE 'consultation_suggestion_confirmation' TO 'consultation_suggestion_booking';
ALTER TYPE "notification_type" ADD VALUE 'consultation_suggestion_cancellation';
ALTER TYPE "notification_type" RENAME VALUE 'add_new_availability' TO 'add_more_availability_slots';

ALTER TABLE "consultation" ALTER COLUMN "time" TYPE timestamptz USING "time" :: timestamp with time zone;

ALTER TABLE "consultation" ADD COLUMN "client_join_time" timestamptz;
ALTER TABLE "consultation" ADD COLUMN "provider_join_time" timestamptz;
ALTER TABLE "consultation" ADD COLUMN "client_leave_time" timestamptz;
ALTER TABLE "consultation" ADD COLUMN "provider_leave_time" timestamptz;
ALTER TABLE "consultation" ADD COLUMN "client_reminder_sent" Boolean DEFAULT false;
ALTER TABLE "consultation" ADD COLUMN "provider_reminder_sent" Boolean DEFAULT false;

ALTER TABLE "chat" DROP COLUMN "messages";
ALTER TABLE "chat" ADD COLUMN "messages" JSON[];
ALTER TABLE "chat" ADD COLUMN "client_socket_id" varchar;
ALTER TABLE "chat" ADD COLUMN "provider_socket_id" varchar;

ALTER TABLE "consultation" ADD COLUMN "price" int DEFAULT NULL;

CREATE TABLE "consultation_security_check" (
  "id" SERIAL UNIQUE,
  "consultation_security_check_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "consultation_id" UUID NOT NULL,
  "contacts_disclosure" Boolean NOT NULL,
  "suggest_outside_meeting" Boolean NOT NULL,
  "identity_coercion" Boolean NOT NULL,
  "unsafe_feeling" Boolean NOT NULL,
  "more_details" varchar DEFAULT NULL,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT NULL
);

ALTER TABLE "consultation_security_check" ADD FOREIGN KEY ("consultation_id") REFERENCES "consultation" ("consultation_id");

-- Triggers --

CREATE TRIGGER update_consultation_security_check_updated_at BEFORE
UPDATE
  ON consultation_security_check FOR EACH ROW EXECUTE PROCEDURE update_updated_at_column();