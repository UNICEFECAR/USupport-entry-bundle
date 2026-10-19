-- 30-minute consultations: every consultation now carries its own length.
-- Existing rows take the DEFAULT of 60, which is the length they were implicitly booked at.
ALTER TABLE "consultation"
ADD COLUMN IF NOT EXISTS "duration_minutes" int NOT NULL DEFAULT 60;

-- Overlap checks filter on (provider|client, time) with a bounded lower edge,
-- so these indexes keep them range scans instead of full history scans.
CREATE INDEX IF NOT EXISTS "consultation_provider_time_idx"
  ON "consultation" ("provider_detail_id", "time");

CREATE INDEX IF NOT EXISTS "consultation_client_time_idx"
  ON "consultation" ("client_detail_id", "time");
