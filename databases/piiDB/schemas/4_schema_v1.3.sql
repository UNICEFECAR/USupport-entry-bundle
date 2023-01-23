CREATE TABLE "auth_otp" (
  "id" SERIAL UNIQUE,
  "otp" varchar NOT NULL,
  "user_id" UUID NOT NULL,
  "used" boolean DEFAULT false,
  "created_at" timestamp DEFAULT (now())
);

ALTER TABLE "auth_otp"
ADD FOREIGN KEY ("user_id") REFERENCES "user" ("user_id");