-- Populate the database with some initial data --

-- region table --
INSERT INTO "region" ("name") VALUES ('ECARO');

-- country table --
INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Albania', 'AL', 'ALB', '008', false);
INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Armenia', 'AM', 'ARM', '051', false);
INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Azerbaijan', 'AZ', 'AZE', '031', false);
INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Belarus', 'BY', 'BLR', '112', false);
INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Bosnia and Herzegovina,', 'BA', 'BIH', '070', false);
INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Georgia', 'GE', 'GEO', '268', false);
INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Kazakhstan', 'KZ', 'KAZ', '398', true);
INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Kosovo', 'XK', 'XKX', null, false);
INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Kyrgyzstan', 'KG', 'KGZ', '417', true);
INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Macedonia', 'MK', 'MKD', '807', false);
INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Moldova', 'MD', 'MDA', '498', false);
INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Montenegro', 'ME', 'MNE', '499', false);
INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Russian Federation', 'RU', 'RUS', '643', false);
INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Serbia', 'RS', 'SRB', '688', false);
INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Tajikistan', 'TJ', 'TJK', '762', false);
INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Turkmenistan', 'TM', 'TKM', '795', false);
INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Ukraine', 'UA', 'UKR', '804', false);
INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Uzbekistan', 'UZ', 'UZB', '860', false);
INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Bulgaria', 'BG', 'BGR', '100', false);
INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Croatia', 'HR', 'HRV', '191', false);
INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Romania', 'RO', 'ROU', '642', false);
INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Slovenia', 'SI', 'SVN', '705', false);

-- language table --
INSERT INTO "language" ("name", "alpha2", "is_active") VALUES ('Albanian', 'sq', false);
INSERT INTO "language" ("name", "alpha2", "is_active") VALUES ('Armenian', 'hy', false);
INSERT INTO "language" ("name", "alpha2", "is_active") VALUES ('Azerbaijani', 'az', false);
INSERT INTO "language" ("name", "alpha2", "is_active") VALUES ('Belarusian', 'be', false);
INSERT INTO "language" ("name", "alpha2", "is_active") VALUES ('Bosnian', 'bs', false);
INSERT INTO "language" ("name", "alpha2", "is_active") VALUES ('Georgian','ka', false);
INSERT INTO "language" ("name", "alpha2", "is_active") VALUES ('Kazakh', 'kk', true);
INSERT INTO "language" ("name", "alpha2", "is_active") VALUES ('Kyrgyz', 'ky', false);
INSERT INTO "language" ("name", "alpha2", "is_active") VALUES ('Macedonian', 'mk', false);
INSERT INTO "language" ("name", "alpha2", "is_active") VALUES ('Russian', 'ru', true);
INSERT INTO "language" ("name", "alpha2", "is_active") VALUES ('Serbian', 'sr', false);
INSERT INTO "language" ("name", "alpha2", "is_active") VALUES ('Tajik', 'tg', false);
INSERT INTO "language" ("name", "alpha2", "is_active") VALUES ('Turkmen', 'tk', false);
INSERT INTO "language" ("name", "alpha2", "is_active") VALUES ('Ukrainian', 'uk', false);
INSERT INTO "language" ("name", "alpha2", "is_active") VALUES ('Uzbek', 'uz', false);
INSERT INTO "language" ("name", "alpha2", "is_active") VALUES ('Bulgarian', 'bg', false);
INSERT INTO "language" ("name", "alpha2", "is_active") VALUES ('Croatian', 'hr', false);
INSERT INTO "language" ("name", "alpha2", "is_active") VALUES ('Romanian', 'ro', false);
INSERT INTO "language" ("name", "alpha2", "is_active") VALUES ('Slovenian', 'sl', false);
INSERT INTO "language" ("name", "alpha2", "is_active") VALUES ('English', 'en', true);

-- service table --
INSERT INTO "service" ("type") VALUES ('text_audio_video_consultation');
