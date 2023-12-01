-- Add new consultation status to the consultation_status enum
ALTER TYPE "consultation_status" ADD VALUE 'late-canceled'; --executed on Staging
ALTER TYPE "consultation_status" ADD VALUE 'active'; -- executed on Staging