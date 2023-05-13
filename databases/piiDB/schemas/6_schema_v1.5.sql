UPDATE provider_detail
SET phone = phone_prefix || phone
WHERE phone <> 'DELETED';
ALTER TABLE provider_detail
DROP COLUMN phone_prefix;

UPDATE sponsor
SET phone = phone_prefix || phone
WHERE phone <> 'DELETED';
ALTER TABLE sponsor
DROP COLUMN phone_prefix;
