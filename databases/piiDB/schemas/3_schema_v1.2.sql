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