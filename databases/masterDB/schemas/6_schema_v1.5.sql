ALTER TABLE language ADD COLUMN local_name varchar;

UPDATE language SET local_name = 'Қазақша' WHERE alpha2 = 'kk';
UPDATE language SET local_name = 'Oʻzbekcha' WHERE alpha2 = 'uz';
UPDATE language SET local_name = 'Српски' WHERE alpha2 = 'sr';
UPDATE language SET local_name = 'Hrvatsk' WHERE alpha2 = 'hr';
UPDATE language SET local_name = 'Shqip' WHERE alpha2 = 'sq';
UPDATE language SET local_name = 'Türkçe' WHERE alpha2 = 'tk';
UPDATE language SET local_name = 'հայերեն' WHERE alpha2 = 'hy';
UPDATE language SET local_name = 'Български' WHERE alpha2 = 'bg';
UPDATE language SET local_name = 'English' WHERE alpha2 = 'en';
UPDATE language SET local_name = 'ქართული' WHERE alpha2 = 'ka';
UPDATE language SET local_name = 'Русский' WHERE alpha2 = 'ru';
UPDATE language SET local_name = 'Slovenščina' WHERE alpha2 = 'sl';
UPDATE language SET local_name = 'Українська' WHERE alpha2 = 'uk';
UPDATE language SET local_name = 'Беларуская' WHERE alpha2 = 'be';
UPDATE language SET local_name = 'Тоҷикӣ' WHERE alpha2 = 'tg';
UPDATE language SET local_name = 'Кыргызча' WHERE alpha2 = 'ky';
UPDATE language SET local_name = 'Română' WHERE alpha2 = 'ro';
UPDATE language SET local_name = 'Македонски' WHERE alpha2 = 'mk';
UPDATE language SET local_name = 'Azərbaycan' WHERE alpha2 = 'az';
UPDATE language SET local_name = 'Bosanski' WHERE alpha2 = 'bs';

UPDATE admin
SET phone = phone_prefix || phone
WHERE phone <> 'DELETED';

ALTER TABLE admin
DROP COLUMN phone_prefix;
