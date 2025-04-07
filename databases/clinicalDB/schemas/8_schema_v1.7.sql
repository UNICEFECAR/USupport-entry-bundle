ALTER TABLE answer ADD COLUMN language_id UUID;
ALTER TABLE consultation_security_check 
ALTER COLUMN consultation_id DROP NOT NULL,
ALTER COLUMN contacts_disclosure DROP NOT NULL,
ALTER COLUMN suggest_outside_meeting DROP NOT NULL,
ALTER COLUMN identity_coercion DROP NOT NULL,
ALTER COLUMN unsafe_feeling DROP NOT NULL,
ALTER COLUMN feeling DROP NOT NULL;