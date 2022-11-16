ALTER TABLE
  availability
ALTER COLUMN
  slots TYPE timestamptz [] USING slots :: timestamp with time zone [];

ALTER TABLE
  availability
ALTER COLUMN
  start_date TYPE timestamptz USING start_date :: timestamp with time zone;