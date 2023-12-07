-- Remove default constraint of consultation_reminder_min in notification_preference
ALTER TABLE notification_preference
ALTER COLUMN consultation_reminder_min DROP DEFAULT;

-- Alter it's column type
ALTER TABLE notification_preference
ALTER COLUMN consultation_reminder_min TYPE INTEGER[] USING ARRAY[consultation_reminder_min];

-- Add: new default constraint 
ALTER TABLE notification_preference
ALTER COLUMN consultation_reminder_min SET DEFAULT '{60}';