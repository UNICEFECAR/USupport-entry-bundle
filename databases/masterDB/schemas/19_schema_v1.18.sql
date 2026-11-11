CREATE TABLE IF NOT EXISTS playandheal_waitlist (
  id SERIAL UNIQUE,
  playandheal_waitlist_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  full_name VARCHAR(150) NOT NULL,
  email VARCHAR(254) NOT NULL,
  location VARCHAR(150),
  language VARCHAR(10),
  created_at TIMESTAMP NOT NULL DEFAULT now(),
  CONSTRAINT playandheal_waitlist_email_unique UNIQUE (email)
);

CREATE INDEX IF NOT EXISTS idx_playandheal_waitlist_created_at
  ON playandheal_waitlist (created_at DESC);
