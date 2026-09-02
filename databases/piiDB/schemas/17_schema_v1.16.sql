-- Armenia-only migration (PII_DB_URL_AM).
-- Do NOT add this file to the piiDB Dockerfile init chain.

ALTER TYPE "specializations_type" ADD VALUE IF NOT EXISTS 'peer_support';

INSERT INTO "work_with" ("topic")
SELECT 'peer_to_peer_emotional_support'
WHERE NOT EXISTS (
  SELECT 1 FROM "work_with" WHERE "topic" = 'peer_to_peer_emotional_support'
);