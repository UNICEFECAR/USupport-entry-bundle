ALTER TABLE "organization" ADD COLUMN "description_ro" varchar;
ALTER TABLE "organization" ADD COLUMN "description_uk" varchar;

CREATE TABLE provider_detail_translations (
  id SERIAL UNIQUE,
  provider_detail_translations_id UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  provider_detail_id UUID NOT NULL,
  language_id UUID NOT NULL,
  name varchar,
  patronym varchar,
  surname varchar,
  nickname varchar,
  description varchar,
  education varchar[],
  city varchar,
  street varchar,
  created_at timestamp DEFAULT (now()),
  updated_at timestamp DEFAULT NULL,
  UNIQUE (provider_detail_id, language_id)
);

ALTER TABLE provider_detail_translations
  ADD FOREIGN KEY (provider_detail_id) REFERENCES provider_detail (provider_detail_id);

CREATE TRIGGER update_provider_detail_translations_updated_at
  BEFORE UPDATE ON provider_detail_translations
  FOR EACH ROW EXECUTE PROCEDURE update_updated_at_column();
