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