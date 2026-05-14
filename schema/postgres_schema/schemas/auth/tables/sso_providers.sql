CREATE TABLE "auth"."sso_providers" (
    "id" uuid NOT NULL,
    "resource_id" text,
    "created_at" timestamp(6) with time zone,
    "updated_at" timestamp(6) with time zone,
    "disabled" boolean,
    CONSTRAINT "sso_providers_pkey" PRIMARY KEY (id),
    CONSTRAINT "resource_id not empty" CHECK (resource_id = NULL::text OR char_length(resource_id) > 0)
);

COMMENT ON TABLE "auth"."sso_providers" IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';

COMMENT ON COLUMN "auth"."sso_providers"."resource_id" IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';

CREATE UNIQUE INDEX "sso_providers_resource_id_idx" ON "auth"."sso_providers" (lower(resource_id));

CREATE INDEX "sso_providers_resource_id_pattern_idx" ON "auth"."sso_providers" (resource_id text_pattern_ops);

