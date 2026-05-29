CREATE TABLE "organization_report" (
    id SERIAL UNIQUE,
    organization_report_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    organization_id UUID NOT NULL,
    client_detail_id UUID NOT NULL,
    created_at TIMESTAMP DEFAULT (NOW()),
    reason varchar NOT NULL
);

ALTER TABLE "organization_report" ADD FOREIGN KEY (organization_id) REFERENCES "organization" ("organization_id");
ALTER TABLE "organization_report" ADD FOREIGN KEY (client_detail_id) REFERENCES "client_detail" ("client_detail_id");