INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Poland', 'PL', 'POL', '616', true);
INSERT INTO "country_currency_links" ("country_id", "currency_id") VALUES ((SELECT "country_id" FROM "country" WHERE "alpha2" = 'PL'), (SELECT "currency_id" FROM "currency" WHERE "code" = 'PLN'));