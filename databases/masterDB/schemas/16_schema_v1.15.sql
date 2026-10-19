-- 30-minute consultations: per-country rollout gate.
-- Controls only whether the provider UI offers a 30-minute option; the backend
-- overlap logic is a no-op while every slot is 60 minutes long.
ALTER TABLE "country"
ADD COLUMN IF NOT EXISTS "has_30_min_slots" boolean DEFAULT false;
