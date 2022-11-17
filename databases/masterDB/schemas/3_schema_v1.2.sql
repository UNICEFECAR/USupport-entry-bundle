CREATE TABLE "refresh_token" (
  "id" SERIAL UNIQUE,
  "refresh_token_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "admin_id" UUID NOT NULL,
  "token" varchar NOT NULL,
  "used" boolean DEFAULT false,
  "expires_at" timestamp NOT NULL,
  "created_at" timestamp DEFAULT (now())
);

CREATE TABLE "password_reset" (
  "id" SERIAL UNIQUE,
  "pass_reset_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "admin_id" UUID NOT NULL,
  "reset_token" varchar NOT NULL,
  "used" boolean DEFAULT false,
  "expires_at" timestamp NOT NULL,
  "created_at" timestamp DEFAULT (now())
);

ALTER TABLE "refresh_token" ADD FOREIGN KEY ("admin_id") REFERENCES "admin" ("admin_id");
ALTER TABLE "password_reset" ADD FOREIGN KEY ("admin_id") REFERENCES "admin" ("admin_id");
