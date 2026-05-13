INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Cyprus', 'CY', 'CYP', '196', false);
INSERT INTO "language" ("name", "alpha2", "is_active", "local_name") VALUES ('Greek', 'el', true, 'ελληνικά');

CREATE TYPE "billing_type" AS ENUM ('coupon', 'free', 'paid');

ALTER TABLE "country" ADD COLUMN "has_payments" boolean DEFAULT false;
ALTER TABLE "country" ADD COLUMN "has_coupons" boolean DEFAULT false;
ALTER TABLE "country" ADD COLUMN "has_free_consultations" boolean DEFAULT true;
ALTER TABLE "country" ADD COLUMN "default_billing_type" billing_type DEFAULT 'free';
ALTER TABLE "country" ADD COLUMN "default_coupon_code" varchar DEFAULT NULL;

ALTER TYPE "action_type" ADD VALUE 'listen';
