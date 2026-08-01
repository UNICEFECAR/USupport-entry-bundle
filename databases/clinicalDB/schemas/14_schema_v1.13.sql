ALTER TABLE "consultation" ADD COLUMN "canceled_by" varchar DEFAULT NULL;
ALTER TABLE "consultation" ADD COLUMN "canceled_at" timestamp DEFAULT NULL;