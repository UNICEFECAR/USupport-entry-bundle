CREATE TABLE "sponsor" (
  "id" SERIAL UNIQUE,
  "sponsor_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "name" varchar NOT NULL,
  "phone_prefix" varchar,
  "phone" varchar,
  "email" varchar UNIQUE NOT NULL,
  "image" varchar DEFAULT 'default-sponsor',
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT NULL
);

CREATE TABLE "campaign" (
  "id" SERIAL UNIQUE,
  "campaign_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "sponsor_id" UUID NOT NULL,
  "name" varchar NOT NULL,
  "coupon_code" varchar UNIQUE NOT NULL,
  "budget" int NOT NULL,
  "no_coupons" int NOT NULL,
  "price_per_coupon" int NOT NULL,
  "max_coupons_per_client" int NOT NULL,
  "start_date" timestamptz NOT NULL,
  "end_date" timestamptz NOT NULL,
  "terms_and_conditions" varchar NOT NULL,
  "active" boolean DEFAULT false,
  "created_at" timestamp DEFAULT (now()),
  "updated_at" timestamp DEFAULT NULL
);

CREATE TABLE "provider_campaign_links" (
  "id" SERIAL UNIQUE,
  "provider_detail_id" UUID NOT NULL,
  "campaign_id" UUID NOT NULL,
  "created_at" timestamp DEFAULT (now())
);

-- Foreign Keys --
ALTER TABLE "campaign" ADD FOREIGN KEY ("sponsor_id") REFERENCES "sponsor" ("sponsor_id");

ALTER TABLE "provider_campaign_links" ADD FOREIGN KEY ("provider_detail_id") REFERENCES "provider_detail" ("provider_detail_id");
ALTER TABLE "provider_campaign_links" ADD FOREIGN KEY ("campaign_id") REFERENCES "campaign" ("campaign_id");

-- Triggers --
CREATE
OR REPLACE FUNCTION update_updated_at_column() RETURNS TRIGGER AS $$ BEGIN NEW.updated_at = now();

RETURN NEW;

END;

$$ language 'plpgsql';

CREATE TRIGGER update_sponsor_updated_at BEFORE
UPDATE
  ON "sponsor" FOR EACH ROW EXECUTE PROCEDURE update_updated_at_column();

ALTER TABLE "availability" ADD COLUMN "campaign_slots" JSON[];

ALTER TABLE "client_detail" ADD COLUMN "push_notification_tokens" VARCHAR[];