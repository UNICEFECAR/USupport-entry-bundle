ALTER TYPE "consultation_status" ADD VALUE 'suggested';
ALTER TYPE "consultation_status" ADD VALUE 'timeout';
ALTER TYPE "consultation_status" ADD VALUE 'rejected';

ALTER TYPE "notification_type" ADD VALUE 'consultation_suggestion_rejection';