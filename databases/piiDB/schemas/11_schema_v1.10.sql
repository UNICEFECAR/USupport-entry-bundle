CREATE TABLE organization (
    id SERIAL UNIQUE,
    organization_id UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
    name TEXT NOT NULL UNIQUE,
    created_by UUID NOT NULL,
    created_at TIMESTAMP DEFAULT (NOW()),
    updated_at TIMESTAMP WITH TIME ZONE
);

CREATE TABLE organization_provider_links (
    id SERIAL UNIQUE,
    organization_id UUID NOT NULL,
    provider_detail_id UUID NOT NULL,
    created_at TIMESTAMP DEFAULT (NOW()),
    deleted_at TIMESTAMP,
    is_deleted BOOLEAN DEFAULT FALSE,
    periods JSONB DEFAULT '[]'::JSONB
);

ALTER TABLE organization_provider_links ADD FOREIGN KEY (organization_id) REFERENCES organization (organization_id);
ALTER TABLE organization_provider_links ADD FOREIGN KEY (provider_detail_id) REFERENCES provider_detail (provider_detail_id);

ALTER TABLE "availability" ADD COLUMN "organization_slots" JSONB DEFAULT '{}'::JSONB;

CREATE
OR REPLACE FUNCTION update_updated_at_column() RETURNS TRIGGER AS $$ BEGIN NEW.updated_at = now();

RETURN NEW;

END;
$$ language 'plpgsql';

CREATE TRIGGER update_organization_updated_at BEFORE
UPDATE
  ON "organization" FOR EACH ROW EXECUTE PROCEDURE update_updated_at_column();