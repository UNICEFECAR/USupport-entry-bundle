CREATE TYPE "transaction_type" AS ENUM ('card', 'coupon');

CREATE TABLE "transaction_log" (
  "id" SERIAL UNIQUE,
  "transaction_log_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "type" transaction_type NOT NULL,
  "consultation_id" UUID NOT NULL,
  "payment_intent" varchar,
  "coupon_id" UUID DEFAULT NULL,
  "created_at" timestamp DEFAULT (now())
);

ALTER TABLE "transaction_log" ADD FOREIGN KEY ("consultation_id") REFERENCES "consultation" ("consultation_id");

ALTER TABLE "transaction_log" ADD COLUMN "payment_refund_id" varchar;
ALTER TYPE "transaction_type" ADD VALUE 'payment_refund';

ALTER TABLE "transaction_log" RENAME COLUMN "coupon_id" TO "campaign_id";