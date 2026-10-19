-- 30-minute consultations: per-slot length for provider availability.
--
-- A map of { "<slot start as epoch seconds>": <minutes> }, shared across the
-- normal / campaign / organization slot pools of the same provider-week --
-- duration is a property of the provider's timeline, not of an individual pool.
-- An absent key means 60 minutes, so every pre-existing row keeps its meaning.
ALTER TABLE "availability"
ADD COLUMN IF NOT EXISTS "slot_durations" JSONB NOT NULL DEFAULT '{}'::JSONB;
