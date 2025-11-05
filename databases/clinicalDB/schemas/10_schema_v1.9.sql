CREATE TYPE question_dimension AS ENUM ('psychological', 'social', 'biological');

CREATE TABLE baseline_assessment_question (
  id SERIAL UNIQUE,
  question_id UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  position INTEGER NOT NULL UNIQUE,
  question_text TEXT NOT NULL,
  dimension question_dimension NOT NULL,
  is_critical BOOLEAN DEFAULT false,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE baseline_assessment_session (
  id SERIAL UNIQUE,
  baseline_assessment_id UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  client_detail_id UUID NULL,
  started_at TIMESTAMP DEFAULT NOW(),
  completed_at TIMESTAMP NULL,
  current_position INTEGER DEFAULT 1,
  status VARCHAR(20) DEFAULT 'in_progress' CHECK (status IN ('in_progress', 'completed', 'abandoned')),
  psychological_score INTEGER NULL,
  biological_score INTEGER NULL,
  social_score INTEGER NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

-- Individual answers
CREATE TABLE baseline_assessment_answer (
  id SERIAL UNIQUE,
  answer_id UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  baseline_assessment_id UUID NOT NULL REFERENCES baseline_assessment_session(baseline_assessment_id) ON DELETE CASCADE,
  question_id UUID NOT NULL REFERENCES baseline_assessment_question(question_id),
  answer_value INTEGER NOT NULL CHECK (answer_value BETWEEN 1 AND 5),
  answered_at TIMESTAMP DEFAULT NOW(),
  
  UNIQUE(baseline_assessment_id, question_id) -- One answer per question per assessment
);

-- Indexes for performance
CREATE INDEX idx_baseline_assessment_session_client_id ON baseline_assessment_session(client_detail_id);
CREATE INDEX idx_baseline_assessment_session_status ON baseline_assessment_session(status);
CREATE INDEX idx_baseline_assessment_answer_assessment_id ON baseline_assessment_answer(baseline_assessment_id);
CREATE INDEX idx_baseline_assessment_answer_question_id ON baseline_assessment_answer(question_id);


INSERT INTO baseline_assessment_question (position, question_text, dimension, is_critical) VALUES 
(1, 'stress_level', 'psychological', false),
(2, 'sadness_anxiety', 'psychological', true),
(3, 'fear_frequency', 'psychological', true),
(4, 'emotion_control', 'psychological', true),
(5, 'worry_anxiety', 'psychological', true),
(6, 'nervousness', 'psychological', false),
(7, 'sensitivity_agitation', 'psychological', false),

(8, 'physical_weakness', 'biological', false),
(9, 'tired_waking', 'biological', false),
(10, 'body_health_concerns', 'biological', false),
(11, 'slow_movements', 'biological', false),

(12, 'friendship_difficulty', 'social', true),
(13, 'communication_difficulty', 'social', true),
(14, 'emotional_expression', 'social', false),
(15, 'parental_overwhelm', 'social', false),
(16, 'school_helplessness', 'social', false),
(17, 'difficult_parents', 'social', false),

(18, 'concentration_problems', 'psychological', false),
(19, 'lack_happiness', 'psychological', true),
(20, 'maturity_pressure', 'psychological', false),

(21, 'internet_dependency', 'social', false),
(22, 'economic_bullying', 'social', false),
(23, 'few_friends', 'social', false),

(24, 'nightmares', 'biological', false),
(25, 'appetite_loss', 'biological', false),
(26, 'substance_use', 'biological', true),
(27, 'frequent_headaches', 'biological', false);
