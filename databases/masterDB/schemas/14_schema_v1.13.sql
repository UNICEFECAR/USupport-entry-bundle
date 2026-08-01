ALTER TABLE "admin"
ADD COLUMN "mfa_enabled" boolean NOT NULL DEFAULT false;

CREATE TABLE "admin_mfa_session" (
  "id" SERIAL UNIQUE,
  "mfa_session_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "admin_id" UUID NOT NULL,
  "completed" boolean DEFAULT false,
  "expires_at" timestamp NOT NULL,
  "created_at" timestamp DEFAULT (now())
);

CREATE TABLE "admin_passkey" (
  "id" SERIAL UNIQUE,
  "passkey_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "admin_id" UUID NOT NULL,
  "credential_id" varchar NOT NULL,
  "public_key" bytea NOT NULL,
  "counter" bigint NOT NULL DEFAULT 0,
  "name" varchar,
  "created_at" timestamp DEFAULT (now()),
  "last_used_at" timestamp DEFAULT NULL
);

CREATE TABLE "admin_passkey_challenge" (
  "id" SERIAL UNIQUE,
  "passkey_challenge_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "admin_id" UUID NOT NULL,
  "mfa_session_id" UUID,
  "challenge" varchar NOT NULL,
  "type" varchar NOT NULL,
  "expires_at" timestamp NOT NULL,
  "created_at" timestamp DEFAULT (now())
);

ALTER TABLE "admin_mfa_session"
ADD FOREIGN KEY ("admin_id") REFERENCES "admin" ("admin_id");

ALTER TABLE "admin_passkey"
ADD FOREIGN KEY ("admin_id") REFERENCES "admin" ("admin_id");

ALTER TABLE "admin_passkey"
ADD UNIQUE ("credential_id");

ALTER TABLE "admin_passkey_challenge"
ADD FOREIGN KEY ("admin_id") REFERENCES "admin" ("admin_id");

ALTER TABLE "admin_passkey_challenge"
ADD FOREIGN KEY ("mfa_session_id") REFERENCES "admin_mfa_session" ("mfa_session_id");
