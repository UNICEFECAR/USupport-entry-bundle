-- Mobile app version gate: drives the in-app "Update available" popup.
-- latest_version        -> users below it get a dismissable (optional) update prompt
-- min_supported_version -> users below it get a blocking (forced) update prompt
-- release_notes         -> localized notes keyed by language alpha2, e.g. { "en": "...", "ru": "..." }
CREATE TABLE IF NOT EXISTS "app_version" (
  "app_version_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "platform" VARCHAR NOT NULL UNIQUE CHECK ("platform" IN ('ios', 'android')),
  "latest_version" VARCHAR NOT NULL,
  "min_supported_version" VARCHAR NOT NULL,
  "store_url" VARCHAR NOT NULL,
  "release_notes" JSONB DEFAULT '{}'::jsonb,
  "created_at" TIMESTAMP DEFAULT now(),
  "updated_at" TIMESTAMP DEFAULT now()
);

INSERT INTO "app_version" ("platform", "latest_version", "min_supported_version", "store_url")
VALUES
  ('android', '1.0.38', '1.0.0', 'https://play.google.com/store/apps/details?id=org.unicef.ecar.usupport'),
  ('ios', '1.0.35', '1.0.0', 'https://apps.apple.com/app/id6447319853')
ON CONFLICT ("platform") DO NOTHING;
