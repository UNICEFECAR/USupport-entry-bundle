-- Add new questions to the consultation_security_check table

ALTER TABLE consultation_security_check
ADD "provider_attend" Boolean NOT NULL DEFAULT TRUE;

CREATE TYPE "safety_feedback_feeling_type" AS ENUM (
    'very_satisfied',
    'satisfied',
    'neutral',
    'dissatisfied',
    'very_dissatisfied'
);

ALTER TABLE consultation_security_check
ADD "feeling" safety_feedback_feeling_type NOT NULL DEFAULT 'very_satisfied';

ALTER TABLE consultation_security_check
ADD "addressed_needs" int DEFAULT 10,
ADD "improve_wellbeing" int DEFAULT 10,
ADD "feelings_now" int DEFAULT 10,
ADD "additional_comment" varchar DEFAULT NULL;

ALTER TYPE "consultation_status" ADD VALUE 'active';
ALTER TYPE "consultation_status" ADD VALUE 'late-canceled';

