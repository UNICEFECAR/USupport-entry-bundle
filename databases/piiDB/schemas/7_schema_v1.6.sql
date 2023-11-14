CREATE TABLE "email_otp" (
    "id" SERIAL UNIQUE,
    "email" VARCHAR NOT NULL,
    "otp" VARCHAR NOT NULL,
    "used" BOOLEAN DEFAULT false,
    "created_at" timestamp DEFAULT (now())
 );