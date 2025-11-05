CREATE TABLE sos_center_click (
    id SERIAL PRIMARY KEY,
    sos_center_id INTEGER NULL,
    is_main BOOLEAN NOT NULL DEFAULT FALSE,
    client_detail_id UUID NULL,
    platform TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TYPE factor_type AS ENUM ('social', 'biological', 'psychological');

CREATE TABLE baseline_assessment_threshold (
    baseline_assessment_threshold_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    factor factor_type NOT NULL,
    below INTEGER NOT NULL,
    above INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);


CREATE TRIGGER update_baseline_assessment_threshold_updated_at BEFORE
UPDATE
  ON baseline_assessment_threshold FOR EACH ROW EXECUTE PROCEDURE update_updated_at_column();
