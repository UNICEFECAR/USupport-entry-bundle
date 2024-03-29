CREATE TABLE "currency" (
  "id"     SERIAL UNIQUE,
  "currency_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
  "name"   varchar NOT NULL,
  "code"   varchar NOT NULL,
  "symbol" varchar,
  "created_at" timestamp DEFAULT (now())
);

CREATE TABLE "country_currency_links" (
  "id" SERIAL UNIQUE,
  "country_id" UUID NOT NULL,
  "currency_id" UUID NOT NULL,
  "created_at" timestamp DEFAULT (now())
);

ALTER TABLE
  "country_currency_links"
ADD
  FOREIGN KEY ("country_id") REFERENCES "country" ("country_id");

ALTER TABLE
  "country_currency_links"
ADD
  FOREIGN KEY ("currency_id") REFERENCES "currency" ("currency_id");

-- Insert currency records
INSERT INTO currency (name, code, symbol) VALUES ('Leke', 'ALL', 'Lek');
INSERT INTO currency (name, code, symbol) VALUES ('Dollars', 'USD', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Afghanis', 'AFN', '؋');
INSERT INTO currency (name, code, symbol) VALUES ('Pesos', 'ARS', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Guilders', 'AWG', 'ƒ');
INSERT INTO currency (name, code, symbol) VALUES ('Dollars', 'AUD', '$');
INSERT INTO currency (name, code, symbol) VALUES ('New Manats', 'AZN', 'ман');
INSERT INTO currency (name, code, symbol) VALUES ('Dollars', 'BSD', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Dollars', 'BBD', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Rubles', 'BYR', 'p.');
INSERT INTO currency (name, code, symbol) VALUES ('Euro', 'EUR', '€');
INSERT INTO currency (name, code, symbol) VALUES ('Dollars', 'BZD', 'BZ$');
INSERT INTO currency (name, code, symbol) VALUES ('Dollars', 'BMD', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Bolivianos', 'BOB', '$b');
INSERT INTO currency (name, code, symbol) VALUES ('Convertible Marka', 'BAM', 'KM');
INSERT INTO currency (name, code, symbol) VALUES ('Pula', 'BWP', 'P');
INSERT INTO currency (name, code, symbol) VALUES ('Leva', 'BGN', 'лв');
INSERT INTO currency (name, code, symbol) VALUES ('Reais', 'BRL', 'R$');
INSERT INTO currency (name, code, symbol) VALUES ('Pounds', 'GBP', '£');
INSERT INTO currency (name, code, symbol) VALUES ('Dollars', 'BND', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Riels', 'KHR', '៛');
INSERT INTO currency (name, code, symbol) VALUES ('Dollars', 'CAD', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Dollars', 'KYD', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Pesos', 'CLP', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Yuan Renminbi', 'CNY', '¥');
INSERT INTO currency (name, code, symbol) VALUES ('Pesos', 'COP', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Colón', 'CRC', '₡');
INSERT INTO currency (name, code, symbol) VALUES ('Kuna', 'HRK', 'kn');
INSERT INTO currency (name, code, symbol) VALUES ('Pesos', 'CUP', '₱');
INSERT INTO currency (name, code, symbol) VALUES ('Koruny', 'CZK', 'Kč');
INSERT INTO currency (name, code, symbol) VALUES ('Kroner', 'DKK', 'kr');
INSERT INTO currency (name, code, symbol) VALUES ('Pesos', 'DOP ', 'RD$');
INSERT INTO currency (name, code, symbol) VALUES ('Dollars', 'XCD', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Pounds', 'EGP', '£');
INSERT INTO currency (name, code, symbol) VALUES ('Colones', 'SVC', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Pounds', 'FKP', '£');
INSERT INTO currency (name, code, symbol) VALUES ('Dollars', 'FJD', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Cedis', 'GHC', '¢');
INSERT INTO currency (name, code, symbol) VALUES ('Pounds', 'GIP', '£');
INSERT INTO currency (name, code, symbol) VALUES ('Quetzales', 'GTQ', 'Q');
INSERT INTO currency (name, code, symbol) VALUES ('Pounds', 'GGP', '£');
INSERT INTO currency (name, code, symbol) VALUES ('Dollars', 'GYD', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Lempiras', 'HNL', 'L');
INSERT INTO currency (name, code, symbol) VALUES ('Dollars', 'HKD', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Forint', 'HUF', 'Ft');
INSERT INTO currency (name, code, symbol) VALUES ('Kronur', 'ISK', 'kr');
INSERT INTO currency (name, code, symbol) VALUES ('Rupees', 'INR', 'Rp');
INSERT INTO currency (name, code, symbol) VALUES ('Rupiahs', 'IDR', 'Rp');
INSERT INTO currency (name, code, symbol) VALUES ('Rials', 'IRR', '﷼');
INSERT INTO currency (name, code, symbol) VALUES ('Pounds', 'IMP', '£');
INSERT INTO currency (name, code, symbol) VALUES ('New Shekels', 'ILS', '₪');
INSERT INTO currency (name, code, symbol) VALUES ('Dollars', 'JMD', 'J$');
INSERT INTO currency (name, code, symbol) VALUES ('Yen', 'JPY', '¥');
INSERT INTO currency (name, code, symbol) VALUES ('Pounds', 'JEP', '£');
INSERT INTO currency (name, code, symbol) VALUES ('Tenge', 'KZT', '₸');
INSERT INTO currency (name, code, symbol) VALUES ('Won', 'KPW', '₩');
INSERT INTO currency (name, code, symbol) VALUES ('Won', 'KRW', '₩');
INSERT INTO currency (name, code, symbol) VALUES ('Soms', 'KGS', 'лв');
INSERT INTO currency (name, code, symbol) VALUES ('Kips', 'LAK', '₭');
INSERT INTO currency (name, code, symbol) VALUES ('Lati', 'LVL', 'Ls');
INSERT INTO currency (name, code, symbol) VALUES ('Pounds', 'LBP', '£');
INSERT INTO currency (name, code, symbol) VALUES ('Dollars', 'LRD', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Switzerland Francs', 'CHF', 'CHF');
INSERT INTO currency (name, code, symbol) VALUES ('Litai', 'LTL', 'Lt');
INSERT INTO currency (name, code, symbol) VALUES ('Denars', 'MKD', 'ден');
INSERT INTO currency (name, code, symbol) VALUES ('Ringgits', 'MYR', 'RM');
INSERT INTO currency (name, code, symbol) VALUES ('Rupees', 'MUR', '₨');
INSERT INTO currency (name, code, symbol) VALUES ('Pesos', 'MXN', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Tugriks', 'MNT', '₮');
INSERT INTO currency (name, code, symbol) VALUES ('Meticais', 'MZN', 'MT');
INSERT INTO currency (name, code, symbol) VALUES ('Dollars', 'NAD', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Rupees', 'NPR', '₨');
INSERT INTO currency (name, code, symbol) VALUES ('Guilders', 'ANG', 'ƒ');
INSERT INTO currency (name, code, symbol) VALUES ('Dollars', 'NZD', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Cordobas', 'NIO', 'C$');
INSERT INTO currency (name, code, symbol) VALUES ('Nairas', 'NGN', '₦');
INSERT INTO currency (name, code, symbol) VALUES ('Krone', 'NOK', 'kr');
INSERT INTO currency (name, code, symbol) VALUES ('Rials', 'OMR', '﷼');
INSERT INTO currency (name, code, symbol) VALUES ('Rupees', 'PKR', '₨');
INSERT INTO currency (name, code, symbol) VALUES ('Balboa', 'PAB', 'B/.');
INSERT INTO currency (name, code, symbol) VALUES ('Guarani', 'PYG', 'Gs');
INSERT INTO currency (name, code, symbol) VALUES ('Nuevos Soles', 'PEN', 'S/.');
INSERT INTO currency (name, code, symbol) VALUES ('Pesos', 'PHP', 'Php');
INSERT INTO currency (name, code, symbol) VALUES ('Zlotych', 'PLN', 'zł');
INSERT INTO currency (name, code, symbol) VALUES ('Rials', 'QAR', '﷼');
INSERT INTO currency (name, code, symbol) VALUES ('New Lei', 'RON', 'lei');
INSERT INTO currency (name, code, symbol) VALUES ('Rubles', 'RUB', 'руб');
INSERT INTO currency (name, code, symbol) VALUES ('Pounds', 'SHP', '£');
INSERT INTO currency (name, code, symbol) VALUES ('Riyals', 'SAR', '﷼');
INSERT INTO currency (name, code, symbol) VALUES ('Dinars', 'RSD', 'Дин.');
INSERT INTO currency (name, code, symbol) VALUES ('Rupees', 'SCR', '₨');
INSERT INTO currency (name, code, symbol) VALUES ('Dollars', 'SGD', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Dollars', 'SBD', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Shillings', 'SOS', 'S');
INSERT INTO currency (name, code, symbol) VALUES ('Rand', 'ZAR', 'R');
INSERT INTO currency (name, code, symbol) VALUES ('Rupees', 'LKR', '₨');
INSERT INTO currency (name, code, symbol) VALUES ('Kronor', 'SEK', 'kr');
INSERT INTO currency (name, code, symbol) VALUES ('Dollars', 'SRD', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Pounds', 'SYP', '£');
INSERT INTO currency (name, code, symbol) VALUES ('New Dollars', 'TWD', 'NT$');
INSERT INTO currency (name, code, symbol) VALUES ('Baht', 'THB', '฿');
INSERT INTO currency (name, code, symbol) VALUES ('Dollars', 'TTD', 'TT$');
INSERT INTO currency (name, code, symbol) VALUES ('Lira', 'TRY', '₺');
INSERT INTO currency (name, code, symbol) VALUES ('Liras', 'TRL', '£');
INSERT INTO currency (name, code, symbol) VALUES ('Dollars', 'TVD', '$');
INSERT INTO currency (name, code, symbol) VALUES ('Hryvnia', 'UAH', '₴');
INSERT INTO currency (name, code, symbol) VALUES ('Pesos', 'UYU', '$U');
INSERT INTO currency (name, code, symbol) VALUES ('Sums', 'UZS', 'лв');
INSERT INTO currency (name, code, symbol) VALUES ('Bolivares Fuertes', 'VEF', 'Bs');
INSERT INTO currency (name, code, symbol) VALUES ('Dong', 'VND', '₫');
INSERT INTO currency (name, code, symbol) VALUES ('Rials', 'YER', '﷼');
INSERT INTO currency (name, code, symbol) VALUES ('Zimbabwe Dollars', 'ZWD', 'Z$');
INSERT INTO currency (name, code, symbol) VALUES ('Rupees', 'INR', '₹');

INSERT INTO "country_currency_links" ("country_id", "currency_id") VALUES ((SELECT "country_id" FROM "country" WHERE "alpha2" = 'KZ'), (SELECT "currency_id" FROM "currency" WHERE "code" = 'KZT'));