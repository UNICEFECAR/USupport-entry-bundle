CREATE TABLE "auth_otp" (
  "id" SERIAL UNIQUE,
  "otp" varchar NOT NULL,
  "admin_id" UUID NOT NULL,
  "used" boolean DEFAULT false,
  "created_at" timestamp DEFAULT (now())
);

ALTER TABLE "auth_otp"
ADD FOREIGN KEY ("admin_id") REFERENCES "admin" ("admin_id");

ALTER TABLE "currency"
ADD COLUMN "min_price" float;

UPDATE "currency"
SET "min_price" = 250
WHERE "code" = 'KZT';