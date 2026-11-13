BEGIN;

ALTER TABLE country
  ADD COLUMN IF NOT EXISTS user_guides_active BOOLEAN;

ALTER TABLE country
  ALTER COLUMN user_guides_active SET DEFAULT FALSE,
  ALTER COLUMN user_guides_active SET NOT NULL;

COMMIT;
