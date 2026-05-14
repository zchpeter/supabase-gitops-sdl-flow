CREATE TABLE "auth"."saml_providers" (
    "id" uuid NOT NULL,
    "sso_provider_id" uuid NOT NULL,
    "entity_id" text NOT NULL,
    "metadata_xml" text NOT NULL,
    "metadata_url" text,
    "attribute_mapping" jsonb,
    "created_at" timestamp(6) with time zone,
    "updated_at" timestamp(6) with time zone,
    "name_id_format" text,
    CONSTRAINT "saml_providers_pkey" PRIMARY KEY (id),
    CONSTRAINT "saml_providers_entity_id_key" UNIQUE (entity_id),
    CONSTRAINT "entity_id not empty" CHECK (char_length(entity_id) > 0),
    CONSTRAINT "metadata_url not empty" CHECK (metadata_url = NULL::text OR char_length(metadata_url) > 0),
    CONSTRAINT "metadata_xml not empty" CHECK (char_length(metadata_xml) > 0),
    CONSTRAINT "saml_providers_sso_provider_id_fkey" FOREIGN KEY ("sso_provider_id") REFERENCES "auth"."sso_providers" ("id") ON DELETE CASCADE
);

COMMENT ON TABLE "auth"."saml_providers" IS 'Auth: Manages SAML Identity Provider connections.';

CREATE INDEX "saml_providers_sso_provider_id_idx" ON "auth"."saml_providers" (sso_provider_id);

