INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'PlayAndHeal', 'PS', 'PSE', '275', true);

INSERT INTO "language" ("name", "alpha2", "is_active") VALUES ('Arabic', 'ar', true);
INSERT INTO "language" ("name", "alpha2", "is_active") VALUES ('Turkish', 'tr', true);

CREATE TYPE event_type AS ENUM (
  'web_email_register_click', 
  'web_anonymous_register_click', 
  'web_guest_register_click', 
  'web_schedule_button_click', 
  'web_join_consultation_click',
  'web_consultation_scheduled',
  'mobile_email_register_click', 
  'mobile_anonymous_register_click', 
  'mobile_guest_register_click', 
  'mobile_schedule_button_click',
  'mobile_join_consultation_click',
  'mobile_consultation_scheduled'
  );


CREATE TABLE country_event (
  id SERIAL PRIMARY KEY,
  country_id UUID NOT NULL,
  event_type event_type NOT NULL,
  client_detail_id UUID,
  created_at TIMESTAMP NOT NULL DEFAULT now(),
  updated_at TIMESTAMP NOT NULL DEFAULT now()
);

ALTER TABLE country_event ADD FOREIGN KEY (country_id) REFERENCES country (country_id);
CREATE INDEX idx_country_event_country_id ON country_event (country_id);

ALTER TYPE event_type ADD VALUE 'global_visit';
ALTER TABLE country_event ALTER COLUMN country_id DROP NOT NULL;
ALTER TABLE country_event ADD COLUMN visitor_id UUID;

ALTER TYPE event_type ADD VALUE 'playandheal_visit';
ALTER TYPE event_type ADD VALUE 'playandheal_visit_qr';

ALTER TYPE event_type ADD VALUE 'mobile_consultation_canceled';
ALTER TYPE event_type ADD VALUE 'mobile_consultation_late_canceled';
ALTER TYPE event_type ADD VALUE 'web_consultation_late_canceled';
ALTER TYPE event_type ADD VALUE 'web_consultation_late_canceled';
ALTER TYPE event_type ADD VALUE 'web_consultation_rescheduled';
ALTER TYPE event_type ADD VALUE 'mobile_consultation_rescheduled';

