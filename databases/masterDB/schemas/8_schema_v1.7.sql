INSERT INTO "country" ("region_id", "name", "alpha2", "alpha3", "num3", "is_active", "local_name") VALUES ((SELECT "region_id" FROM "region" WHERE "name" = 'ECARO'), 'Poland', 'PL', 'POL', '616', true, 'Polska') ;
INSERT INTO "country_currency_links" ("country_id", "currency_id") VALUES ((SELECT "country_id" FROM "country" WHERE "alpha2" = 'PL'), (SELECT "currency_id" FROM "currency" WHERE "code" = 'PLN'));

INSERT INTO "language" ("name", "alpha2", "is_active", "local_name") VALUES ('Polish', 'pl', true, 'Polski');

CREATE TABLE "country_language_links" (
    "id" SERIAL UNIQUE,
    "country_id" UUID NOT NULL,
    "language_id" UUID NOT NULL,
    "created_at" timestamp DEFAULT (now())
);

ALTER TABLE "country_language_links" ADD FOREIGN KEY ("country_id") REFERENCES "country" ("country_id");
ALTER TABLE "country_language_links" ADD FOREIGN KEY ("language_id") REFERENCES "language" ("language_id");