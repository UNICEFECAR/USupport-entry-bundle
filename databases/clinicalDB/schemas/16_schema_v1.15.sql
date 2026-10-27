-- Run manually in each country's clinical database before deploying report support.
BEGIN;
CREATE TABLE consultation_problem_report (
  report_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  consultation_id UUID NOT NULL REFERENCES consultation(consultation_id),
  reporter_type VARCHAR(8) NOT NULL CHECK (reporter_type IN ('client', 'provider')),
  message TEXT NOT NULL CHECK (char_length(btrim(message)) BETWEEN 1 AND 2000),
  submitted_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  idempotency_key UUID NOT NULL,
  source VARCHAR(16) NOT NULL CHECK (source IN ('web', 'ios_app', 'android_app', 'unknown')),
  app_version VARCHAR(100), browser_name VARCHAR(100), browser_version VARCHAR(100),
  os_name VARCHAR(100), os_version VARCHAR(100),
  device_type VARCHAR(10) NOT NULL DEFAULT 'unknown' CHECK (device_type IN ('phone', 'tablet', 'desktop', 'unknown')),
  interface_language VARCHAR(16), reporter_timezone VARCHAR(100),
  call_context JSONB,
  UNIQUE (consultation_id, reporter_type, idempotency_key)
);
CREATE INDEX consultation_problem_report_submitted_idx ON consultation_problem_report(submitted_at DESC, report_id);
CREATE INDEX consultation_problem_report_consultation_idx ON consultation_problem_report(consultation_id);
-- Transactional email outbox: one job per report, retried independently of submission.
CREATE TABLE consultation_problem_report_email_outbox (
  report_id UUID PRIMARY KEY REFERENCES consultation_problem_report(report_id),
  attempts INTEGER NOT NULL DEFAULT 0,
  next_attempt_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  sent_at TIMESTAMPTZ,
  last_error VARCHAR(500)
);
CREATE INDEX consultation_report_email_pending_idx ON consultation_problem_report_email_outbox(next_attempt_at) WHERE sent_at IS NULL;
COMMIT;
