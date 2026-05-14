CREATE TABLE "auth"."sso_domains" (
    "id" uuid NOT NULL,
    "sso_provider_id" uuid NOT NULL,
    "domain" text NOT NULL,
    "created_at" timestamp(6) with time zone,
    "updated_at" timestamp(6) with time zone,
    CONSTRAINT "sso_domains_pkey" PRIMARY KEY (id),
    CONSTRAINT "domain not empty" CHECK (char_length(domain) > 0),
    CONSTRAINT "sso_domains_sso_provider_id_fkey" FOREIGN KEY ("sso_provider_id") REFERENCES "auth"."sso_providers" ("id") ON DELETE CASCADE
);

COMMENT ON TABLE "auth"."sso_domains" IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';

CREATE UNIQUE INDEX "sso_domains_domain_idx" ON "auth"."sso_domains" (lower(domain));

CREATE INDEX "sso_domains_sso_provider_id_idx" ON "auth"."sso_domains" (sso_provider_id);

