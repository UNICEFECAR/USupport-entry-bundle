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

ALTER TABLE country ADD COLUMN local_name varchar;

UPDATE country SET local_name = "Кыргызстан" WHERE alpha2 = "KG";
UPDATE country SET local_name = "Азәрбајҹан" WHERE alpha2 = "AZ";
UPDATE country SET local_name = "Shqipëria" WHERE alpha2 = "AL";
UPDATE country SET local_name = "Crna Gora" WHERE alpha2 = "ME";
UPDATE country SET local_name = "Беларусь" WHERE alpha2 = "BY";
UPDATE country SET local_name = "Bosna i Hercegovina" WHERE alpha2 = "BA";
UPDATE country SET local_name = "Қазақстан" WHERE alpha2 = "KZ";
UPDATE country SET local_name = "Kosova" WHERE alpha2 = "XK";
UPDATE country SET local_name = "Moldova" WHERE alpha2 = "MD";
UPDATE country SET local_name = "România" WHERE alpha2 = "RO";
UPDATE country SET local_name = "Oʻzbekiston”" WHERE alpha2 = "UZ";
UPDATE country SET local_name = "България" WHERE alpha2 = "BG";
UPDATE country SET local_name = "Україна" WHERE alpha2 = "UA";
UPDATE country SET local_name = "Türkmenistan" WHERE alpha2 = "TM";
UPDATE country SET local_name = "Հայաստան" WHERE alpha2 = "AM";
UPDATE country SET local_name = "Тоҷикистон" WHERE alpha2 = "TJ";
UPDATE country SET local_name = "საქართველო" WHERE alpha2 = "GE";
UPDATE country SET local_name = "Северна Македонија" WHERE alpha2 = "MK";
UPDATE country SET local_name = "Hrvatska" WHERE alpha2 = "HR";
UPDATE country SET local_name = "Россия" WHERE alpha2 = "RU";
UPDATE country SET local_name = "Slovenija" WHERE alpha2 = "SI";
UPDATE country SET local_name = "Србија" WHERE alpha2 = "RS";