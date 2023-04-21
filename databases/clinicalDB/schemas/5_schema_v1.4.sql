CREATE TYPE "question_status_type" AS ENUM (
    'active',
    'archived',
    'deleted'
);

CREATE TYPE "question_report_action_type" AS ENUM (
    'delete',
    'archive',
    'activate'
);

CREATE TABLE "question" (
    "id" SERIAL UNIQUE,
    "question_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
    "question" varchar NOT NULL,
    "client_detail_id" UUID NOT NULL,
    "status" question_status_type NOT NULL DEFAULT 'active',
    "created_at" timestamp DEFAULT (now())
);

CREATE TABLE "answer"(
    "id" SERIAL UNIQUE,
    "answer_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
    "title" varchar NOT NULL,
    "text" varchar NOT NULL,
    "question_id" UUID NOT NULL,
    "provider_detail_id" UUID NOT NULL,
    "likes" varchar[] DEFAULT '{}',
    "dislikes" varchar[] DEFAULT '{}',
    "created_at" timestamp DEFAULT (now())
);

ALTER TABLE
  "answer"
ADD
  FOREIGN KEY ("question_id") REFERENCES "question" ("question_id");

CREATE TABLE "tags"(
    "id" SERIAL UNIQUE,
    "tag_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
    "tag" varchar NOT NULL,
    "created_at" timestamp DEFAULT (now())
);

CREATE TABLE "answer_tags_links"(
    "id" SERIAL UNIQUE,
    "answer_id" UUID NOT NULL,
    "tag_id" UUID NOT NULL,
    "created_at" timestamp DEFAULT (now())
);

CREATE TABLE "question_report_log"(
    "id" SERIAL UNIQUE,
    "report_id" UUID PRIMARY KEY DEFAULT (gen_random_uuid()),
    "question_id" UUID NOT NULL,
    "reason" varchar,
    "action" question_report_action_type NOT NULL default 'archive',
    "additional_text" varchar,
    "provider_detail_id" UUID,
    "admin_id" UUID,
    "created_at" timestamp DEFAULT (now())
);

ALTER TABLE
    "question_report_log"
ADD
    FOREIGN KEY ("question_id") REFERENCES "question" ("question_id");