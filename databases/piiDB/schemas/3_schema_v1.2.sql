ALTER TABLE
  availability
ALTER COLUMN
  slots TYPE timestamptz [] USING slots :: timestamp with time zone [];

ALTER TABLE
  availability
ALTER COLUMN
  start_date TYPE timestamptz USING start_date :: timestamp with time zone;

ALTER TYPE "living_type" RENAME TO "urban_rural_type";

ALTER TABLE "client_detail" ALTER COLUMN "living_place" TYPE "urban_rural_type";
ALTER TABLE "client_detail" RENAME COLUMN "living_place" TO "urban_rural";

ALTER TABLE "provider_detail" RENAME COLUMN "address" TO "street";
ALTER TABLE "provider_detail" ADD "city" varchar;
ALTER TABLE "provider_detail" ADD "postcode" varchar;

ALTER TYPE "specializations_type" RENAME VALUE 'coach' TO 'DELETED';

ALTER TABLE "provider_detail" ADD "video_link" varchar;

CREATE TABLE "contact_form" (
    "id" SERIAL UNIQUE,
    "contact_form_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
    "email" varchar NOT NULL,
    "subject" varchar NOT NULL,
    "message" varchar NOT NULL,
    "created_at" timestamp DEFAULT (now())
);

CREATE TABLE "information_portal_suggestion" (
    "id" SERIAL UNIQUE,
    "information_portal_suggestion_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
    "client_detail_id" UUID NOT NULL,
    "suggestion" varchar NOT NULL,
    "created_at" timestamp DEFAULT (now())
);

ALTER TABLE "information_portal_suggestion" ADD  FOREIGN KEY ("client_detail_id") REFERENCES "client_detail" ("client_detail_id");


CREATE TABLE "client_rating" (
    "id" SERIAL UNIQUE,
    "client_rating_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
    "client_detail_id" UUID NOT NULL,
    "rating" int NOT NULL,
    "comment" varchar,
    "created_at" timestamp DEFAULT (now())
);

ALTER TABLE "client_rating" ADD  FOREIGN KEY ("client_detail_id") REFERENCES "client_detail" ("client_detail_id");
ALTER TABLE "client_rating" ADD CONSTRAINT check_client_rating_values CHECK (rating BETWEEN 1 AND 5);