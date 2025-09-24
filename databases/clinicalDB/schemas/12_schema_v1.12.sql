ALTER TABLE "mood_tracker" ADD COLUMN "is_critical" BOOLEAN DEFAULT false;
ALTER TABLE "mood_tracker" ADD COLUMN "is_deleted" BOOLEAN DEFAULT false;
ALTER TABLE 'mood_tracker' ADD COLUMN "deleted_at" timestamp DEFAULT NULL;

ALTER TABLE "mood_tracker" ALTER COLUMN "client_detail_id" DROP NOT NULL;