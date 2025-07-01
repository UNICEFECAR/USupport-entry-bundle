CREATE EXTENSION IF NOT EXISTS postgis;

ALTER TABLE "organization"
    ADD COLUMN IF NOT EXISTS "unit_name" TEXT,
    ADD COLUMN IF NOT EXISTS "website_url" TEXT,
    ADD COLUMN IF NOT EXISTS "address" TEXT,
    ADD COLUMN IF NOT EXISTS "phone" TEXT,
    ADD COLUMN IF NOT EXISTS "email" TEXT,
    ADD COLUMN IF NOT EXISTS "geolocation" GEOMETRY(POINT, 4326),
    ADD COLUMN IF NOT EXISTS "description" TEXT;
    

CREATE TABLE IF NOT EXISTS "organization_work_with" (
    id SERIAL UNIQUE, 
    organization_work_with_id UUID PRIMARY KEY DEFAULT gen_random_uuid(), 
    topic TEXT NOT NULL
);

INSERT INTO "organization_work_with" (topic)
VALUES
    ('children'),
    ('children_disabilities'),
    ('adults'),
    ('adults_disabilities');

CREATE TABLE IF NOT EXISTS "organization_work_with_links" (
    id SERIAL UNIQUE,
    organization_id UUID NOT NULL,
    organization_work_with_id UUID NOT NULL,
    created_at TIMESTAMP DEFAULT (NOW())
);

ALTER TABLE "organization_work_with_links"
    ADD FOREIGN KEY (organization_id) REFERENCES "organization" ("organization_id"),
    ADD FOREIGN KEY (organization_work_with_id) REFERENCES "organization_work_with" ("organization_work_with_id");


CREATE TABLE IF NOT EXISTS "district" (
    id SERIAL UNIQUE,
    district_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL
);

INSERT INTO "district" (name)
VALUES
    ('sector_1'),
    ('sector_2'),
    ('sector_3'),
    ('sector_4'),
    ('sector_5'),
    ('sector_6');

ALTER TABLE "organization"
    ADD COLUMN IF NOT EXISTS "district_id" UUID;

ALTER TABLE "organization"
    ADD CONSTRAINT fk_organization_district 
    FOREIGN KEY (district_id) REFERENCES "district" ("district_id");

CREATE TABLE IF NOT EXISTS "payment_method" (
    id SERIAL UNIQUE,
    payment_method_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL
);

INSERT INTO "payment_method" (name)
VALUES
    ('cash'),
    ('bank_transfer'),
    ('card'),
    ('free');

CREATE TABLE IF NOT EXISTS "user_interaction" (
    id SERIAL UNIQUE,
    user_interaction_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL
);

INSERT INTO "user_interaction" (name)
VALUES
    ('in_person'),
    ('online'),
    ('phone'),
    ('hybrid');

ALTER TABLE "organization"
    ADD COLUMN IF NOT EXISTS "payment_method_id" UUID,
    ADD COLUMN IF NOT EXISTS "user_interaction_id" UUID;

ALTER TABLE "organization"
    ADD CONSTRAINT fk_organization_payment_method
    FOREIGN KEY (payment_method_id) REFERENCES "payment_method" ("payment_method_id"),
    ADD CONSTRAINT fk_organization_user_interaction
    FOREIGN KEY (user_interaction_id) REFERENCES "user_interaction" ("user_interaction_id");

CREATE TABLE IF NOT EXISTS "organization_specialisation" (
    id SERIAL UNIQUE,
    organization_specialisation_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL
);

INSERT INTO "organization_specialisation" (name)
VALUES
    ('individual_psychotherapy'),
    ('group_psychotherapy'),
    ('individual_psychological_counseling'),
    ('group_psychological_counseling'),
    ('personal_development_counseling'),
    ('speech_therapy'),
    ('social_information_counseling'),
    ('rehab_autism_children'),
    ('rehab_psycho_neuro_children'),
    ('suicide_prevention_helpline'),
    ('addiction_helpline'),
    ('violence_victim_helpline'),
    ('child_helpline'),
    ('child_psychiatry'),
    ('art_recreational_activities'),
    ('sport_recreational_activities');

CREATE TABLE IF NOT EXISTS "organization_specialisation_links" (
    id SERIAL UNIQUE,
    organization_id UUID NOT NULL,
    organization_specialisation_id UUID NOT NULL,
    created_at TIMESTAMP DEFAULT (NOW())
);

ALTER TABLE "organization_specialisation_links"
    ADD CONSTRAINT fk_organization_specialisation_links_organization
    FOREIGN KEY (organization_id) REFERENCES "organization" ("organization_id"),
    ADD CONSTRAINT fk_organization_specialisation_links_organization_specialisation
    FOREIGN KEY (organization_specialisation_id) REFERENCES "organization_specialisation" ("organization_specialisation_id");