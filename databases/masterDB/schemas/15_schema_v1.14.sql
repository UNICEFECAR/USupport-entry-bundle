ALTER TABLE "country"
ADD COLUMN "timezone" VARCHAR(64) DEFAULT NULL;

-- Eastern Europe / Balkans
UPDATE "country" SET "timezone" = 'Europe/Tirane'    WHERE "alpha2" = 'AL'; 
UPDATE "country" SET "timezone" = 'Europe/Minsk'     WHERE "alpha2" = 'BY'; 
UPDATE "country" SET "timezone" = 'Europe/Sarajevo'  WHERE "alpha2" = 'BA'; 
UPDATE "country" SET "timezone" = 'Europe/Sofia'     WHERE "alpha2" = 'BG'; 
UPDATE "country" SET "timezone" = 'Europe/Zagreb'    WHERE "alpha2" = 'HR'; 
UPDATE "country" SET "timezone" = 'Europe/Belgrade'  WHERE "alpha2" = 'XK'; 
UPDATE "country" SET "timezone" = 'Europe/Skopje'    WHERE "alpha2" = 'MK'; 
UPDATE "country" SET "timezone" = 'Europe/Chisinau'  WHERE "alpha2" = 'MD'; 
UPDATE "country" SET "timezone" = 'Europe/Podgorica' WHERE "alpha2" = 'ME'; 
UPDATE "country" SET "timezone" = 'Europe/Warsaw'    WHERE "alpha2" = 'PL'; 
UPDATE "country" SET "timezone" = 'Europe/Bucharest' WHERE "alpha2" = 'RO'; 
UPDATE "country" SET "timezone" = 'Europe/Moscow'    WHERE "alpha2" = 'RU'; 
UPDATE "country" SET "timezone" = 'Europe/Belgrade'  WHERE "alpha2" = 'RS'; 
UPDATE "country" SET "timezone" = 'Europe/Ljubljana' WHERE "alpha2" = 'SI'; 
UPDATE "country" SET "timezone" = 'Europe/Kyiv'      WHERE "alpha2" = 'UA'; 
-- Caucasus / Western Asia
UPDATE "country" SET "timezone" = 'Asia/Yerevan'    WHERE "alpha2" = 'AM'; 
UPDATE "country" SET "timezone" = 'Asia/Baku'        WHERE "alpha2" = 'AZ'; 
UPDATE "country" SET "timezone" = 'Asia/Tbilisi'     WHERE "alpha2" = 'GE'; 
-- Central Asia
UPDATE "country" SET "timezone" = 'Asia/Almaty'      WHERE "alpha2" = 'KZ'; 
UPDATE "country" SET "timezone" = 'Asia/Bishkek'     WHERE "alpha2" = 'KG'; 
UPDATE "country" SET "timezone" = 'Asia/Dushanbe'    WHERE "alpha2" = 'TJ'; 
UPDATE "country" SET "timezone" = 'Asia/Ashgabat'    WHERE "alpha2" = 'TM'; 
UPDATE "country" SET "timezone" = 'Asia/Tashkent'    WHERE "alpha2" = 'UZ'; 
-- Middle East / Mediterranean
UPDATE "country" SET "timezone" = 'Asia/Nicosia'     WHERE "alpha2" = 'CY'; 
UPDATE "country" SET "timezone" = 'Asia/Hebron'      WHERE "alpha2" = 'PS'; 

ALTER TABLE "country" ALTER COLUMN timezone SET NOT NULL;