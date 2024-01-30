CREATE TABLE "platform_password" (
    "id" serial NOT NULL,
    "value" varchar NOT NULL,
    "created_at" timestamp with time zone DEFAULT now(),
    CONSTRAINT "platform_password_pkey" PRIMARY KEY ("id")
);