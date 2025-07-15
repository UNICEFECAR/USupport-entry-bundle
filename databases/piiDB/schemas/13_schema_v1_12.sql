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

CREATE TABLE IF NOT EXISTS "organization_user_interaction_links" (
    id SERIAL UNIQUE,
    organization_id UUID NOT NULL,
    user_interaction_id UUID NOT NULL,
    created_at TIMESTAMP DEFAULT (NOW())
);

ALTER TABLE "organization_user_interaction_links"
    ADD CONSTRAINT fk_organization_user_interaction_links_organization
    FOREIGN KEY (organization_id) REFERENCES "organization" ("organization_id"),
    ADD CONSTRAINT fk_organization_user_interaction_links_user_interaction
    FOREIGN KEY (user_interaction_id) REFERENCES "user_interaction" ("user_interaction_id");  

CREATE TABLE IF NOT EXISTS "organization_payment_method_links" (
    id SERIAL UNIQUE,
    organization_id UUID NOT NULL,
    payment_method_id UUID NOT NULL,
    created_at TIMESTAMP DEFAULT (NOW())
);

ALTER TABLE "organization_payment_method_links"
    ADD CONSTRAINT fk_organization_payment_method_links_organization
    FOREIGN KEY (organization_id) REFERENCES "organization" ("organization_id"),
    ADD CONSTRAINT fk_organization_payment_method_links_payment_method
    FOREIGN KEY (payment_method_id) REFERENCES "payment_method" ("payment_method_id");

ALTER TABLE "organization" 
    DROP CONSTRAINT IF EXISTS fk_organization_payment_method,
    DROP CONSTRAINT IF EXISTS fk_organization_user_interaction,
    DROP COLUMN IF EXISTS "payment_method_id",
    DROP COLUMN IF EXISTS "user_interaction_id",
    DROP COLUMN IF EXISTS "unit_name";

CREATE TABLE IF NOT EXISTS "organization_property_type" (
    id SERIAL UNIQUE,
    organization_property_type_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL
);

INSERT INTO "organization_property_type" (name)
VALUES
    ('public'),
    ('private'),
    ('ong'),
    ('public_private');

CREATE TABLE IF NOT EXISTS "organization_property_type_links" (
    id SERIAL UNIQUE,
    organization_id UUID NOT NULL,
    organization_property_type_id UUID NOT NULL,
    created_at TIMESTAMP DEFAULT (NOW())
);

ALTER TABLE "organization_property_type_links"
    ADD CONSTRAINT fk_organization_property_type_links_organization
    FOREIGN KEY (organization_id) REFERENCES "organization" ("organization_id"),
    ADD CONSTRAINT fk_organization_property_type_links_organization_property_type
    FOREIGN KEY (organization_property_type_id) REFERENCES "organization_property_type" ("organization_property_type_id");


-- UPDATE work_with topics to include new topics
DELETE FROM "organization_work_with_links";

DELETE FROM "organization_work_with";

INSERT INTO "organization_work_with" (topic)
VALUES
    ('aggression_violence_victim_or_aggressor'),
    ('learning_difficulties_special_educational_needs'),
    ('behavioral_disorder'),
    ('eating_disorder'),
    ('suicide_self_harm'),
    ('addiction'),
    ('identity_issues'),
    ('illness_oncological_treatment_chronic_diseases'),
    ('other_situations');

-- UPDATE organization_specialisations
DELETE FROM "organization_specialisation_links";

DELETE FROM "organization_specialisation";

INSERT INTO "organization_specialisation" (name)
VALUES
    ('emergency_situations'),
    ('pediatric_psychiatry'),
    ('psychological_evaluation'),
    ('psychological_counseling'),
    ('individual_psychotherapy'),
    ('group_psychotherapy'),
    ('support_groups'),
    ('social_assistance_and_counseling'),
    ('personal_development'),
    ('vocational_counseling_and_career_guidance'),
    ('speech_therapy'),
    ('occupational_therapy_ergotherapy'),
    ('physiotherapy_physical_recovery'),
    ('autism_spectrum_disorder_therapies'),
    ('disability_assessment'),
    ('pediatric_neurology'),
    ('special_psychopedagogy'),
    ('neuropsychomotor_recovery');

-- UPDATE organization_user_interaction
DELETE FROM "organization_payment_method_links";

DELETE FROM "payment_method";

INSERT INTO "payment_method" (name)
VALUES
    ('free_services'),
    ('paid_services'),
    ('co_payment_services'),
    ('cnas_reimbursed_services');

ALTER TABLE "organization"
    ADD COLUMN IF NOT EXISTS "deleted_at" timestamp DEFAULT NULL,
    ADD COLUMN IF NOT EXISTS "is_deleted" BOOLEAN DEFAULT FALSE;