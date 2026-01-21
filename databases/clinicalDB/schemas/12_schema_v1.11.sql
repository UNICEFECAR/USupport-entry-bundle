-- Query to get the mapped specialisation_slug for a given factor and level
-- IMPORTANT: Should be executed on PII DB
WITH mapping (slug, factor, level) AS (
  VALUES
  -- BIOLOGICAL
  ('pediatric_neurology',                 'biological','low'),
  ('occupational_therapy_ergotherapy',    'biological','medium'),
  ('pediatric_neurology',                 'biological','medium'),
  ('emergency_situations',                'biological','high'),
  ('occupational_therapy_ergotherapy',    'biological','high'),
  ('physiotherapy_physical_recovery',     'biological','high'),
  ('disability_assessment',               'biological','high'),
  ('pediatric_neurology',                 'biological','high'),
  ('neuropsychomotor_recovery',           'biological','high'),

  -- PSYCHOLOGICAL
  ('psychological_evaluation',            'psychological','low'),
  ('psychological_counseling',            'psychological','low'),
  ('personal_development',                'psychological','low'),

  ('psychological_evaluation',            'psychological','medium'),
  ('psychological_counseling',            'psychological','medium'),
  ('individual_psychotherapy',            'psychological','medium'),
  ('support_groups',                      'psychological','medium'),
  ('personal_development',                'psychological','medium'),

  ('emergency_situations',                'psychological','high'),
  ('pediatric_psychiatry',                'psychological','high'),
  ('psychological_evaluation',            'psychological','high'),
  ('psychological_counseling',            'psychological','high'),
  ('individual_psychotherapy',            'psychological','high'),
  ('group_psychotherapy',                 'psychological','high'),
  ('support_groups',                      'psychological','high'),

  -- SOCIAL
  ('vocational_counseling_and_career_guidance','social','low'),
  ('personal_development',                'social','low'),

  ('vocational_counseling_and_career_guidance','social','medium'),
  ('support_groups',                      'social','medium'),
  ('personal_development',                'social','medium'),

  ('emergency_situations',                'social','high'),
  ('vocational_counseling_and_career_guidance','social','high'),
  ('speech_therapy',                      'social','high'),
  ('autism_spectrum_disorder_therapies',  'social','high'),
  ('special_psychopedagogy',              'social','high'),
  ('support_groups',                      'social','high'),
  ('social_assistance_and_counseling',    'social','high')
)
SELECT s.organization_specialisation_id,
       m.factor,
       m.level,
       s.name AS specialisation_slug
FROM mapping m
JOIN organization_specialisation s
  ON s.name = m.slug
ORDER BY m.factor, m.level, s.name;



CREATE TABLE baseline_assessment_matching (
    baseline_assessment_matching_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    organization_specialisation_id UUID NOT NULL,
    factor VARCHAR(36) NOT NULL CHECK (factor IN ('social', 'biological', 'psychological')),
    level VARCHAR(6) NOT NULL CHECK (level IN ('low', 'medium', 'high')),
	specialisation_slug VARCHAR,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),

    UNIQUE(organization_specialisation_id, factor, level)
);

CREATE TRIGGER update_baseline_assessment_matching_updated_at BEFORE
UPDATE
  ON baseline_assessment_matching FOR EACH ROW EXECUTE PROCEDURE update_updated_at_column();


