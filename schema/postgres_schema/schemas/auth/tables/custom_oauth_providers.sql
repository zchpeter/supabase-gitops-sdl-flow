CREATE TABLE "auth"."custom_oauth_providers" (
    "id" uuid DEFAULT gen_random_uuid() NOT NULL,
    "provider_type" text NOT NULL,
    "identifier" text NOT NULL,
    "name" text NOT NULL,
    "client_id" text NOT NULL,
    "client_secret" text NOT NULL,
    "acceptable_client_ids" _text DEFAULT '{}'::text[] NOT NULL,
    "scopes" _text DEFAULT '{}'::text[] NOT NULL,
    "pkce_enabled" boolean DEFAULT true NOT NULL,
    "attribute_mapping" jsonb DEFAULT '{}'::jsonb NOT NULL,
    "authorization_params" jsonb DEFAULT '{}'::jsonb NOT NULL,
    "enabled" boolean DEFAULT true NOT NULL,
    "email_optional" boolean DEFAULT false NOT NULL,
    "issuer" text,
    "discovery_url" text,
    "skip_nonce_check" boolean DEFAULT false NOT NULL,
    "cached_discovery" jsonb,
    "discovery_cached_at" timestamp(6) with time zone,
    "authorization_url" text,
    "token_url" text,
    "userinfo_url" text,
    "jwks_uri" text,
    "created_at" timestamp(6) with time zone DEFAULT now() NOT NULL,
    "updated_at" timestamp(6) with time zone DEFAULT now() NOT NULL,
    CONSTRAINT "custom_oauth_providers_pkey" PRIMARY KEY (id),
    CONSTRAINT "custom_oauth_providers_identifier_key" UNIQUE (identifier),
    CONSTRAINT "custom_oauth_providers_authorization_url_https" CHECK (authorization_url IS NULL OR authorization_url ~~ 'https://%'::text),
    CONSTRAINT "custom_oauth_providers_authorization_url_length" CHECK (authorization_url IS NULL OR char_length(authorization_url) <= 2048),
    CONSTRAINT "custom_oauth_providers_client_id_length" CHECK (char_length(client_id) >= 1 AND char_length(client_id) <= 512),
    CONSTRAINT "custom_oauth_providers_discovery_url_length" CHECK (discovery_url IS NULL OR char_length(discovery_url) <= 2048),
    CONSTRAINT "custom_oauth_providers_identifier_format" CHECK (identifier ~ '^[a-z0-9][a-z0-9:-]{0,48}[a-z0-9]$'::text),
    CONSTRAINT "custom_oauth_providers_issuer_length" CHECK (issuer IS NULL OR char_length(issuer) >= 1 AND char_length(issuer) <= 2048),
    CONSTRAINT "custom_oauth_providers_jwks_uri_https" CHECK (jwks_uri IS NULL OR jwks_uri ~~ 'https://%'::text),
    CONSTRAINT "custom_oauth_providers_jwks_uri_length" CHECK (jwks_uri IS NULL OR char_length(jwks_uri) <= 2048),
    CONSTRAINT "custom_oauth_providers_name_length" CHECK (char_length(name) >= 1 AND char_length(name) <= 100),
    CONSTRAINT "custom_oauth_providers_oauth2_requires_endpoints" CHECK (provider_type <> 'oauth2'::text OR authorization_url IS NOT NULL AND token_url IS NOT NULL AND userinfo_url IS NOT NULL),
    CONSTRAINT "custom_oauth_providers_oidc_discovery_url_https" CHECK (provider_type <> 'oidc'::text OR discovery_url IS NULL OR discovery_url ~~ 'https://%'::text),
    CONSTRAINT "custom_oauth_providers_oidc_issuer_https" CHECK (provider_type <> 'oidc'::text OR issuer IS NULL OR issuer ~~ 'https://%'::text),
    CONSTRAINT "custom_oauth_providers_oidc_requires_issuer" CHECK (provider_type <> 'oidc'::text OR issuer IS NOT NULL),
    CONSTRAINT "custom_oauth_providers_provider_type_check" CHECK (provider_type = ANY (ARRAY['oauth2'::text, 'oidc'::text])),
    CONSTRAINT "custom_oauth_providers_token_url_https" CHECK (token_url IS NULL OR token_url ~~ 'https://%'::text),
    CONSTRAINT "custom_oauth_providers_token_url_length" CHECK (token_url IS NULL OR char_length(token_url) <= 2048),
    CONSTRAINT "custom_oauth_providers_userinfo_url_https" CHECK (userinfo_url IS NULL OR userinfo_url ~~ 'https://%'::text),
    CONSTRAINT "custom_oauth_providers_userinfo_url_length" CHECK (userinfo_url IS NULL OR char_length(userinfo_url) <= 2048)
);

CREATE INDEX "custom_oauth_providers_created_at_idx" ON "auth"."custom_oauth_providers" (created_at);

CREATE INDEX "custom_oauth_providers_enabled_idx" ON "auth"."custom_oauth_providers" (enabled);

CREATE INDEX "custom_oauth_providers_identifier_idx" ON "auth"."custom_oauth_providers" (identifier);

CREATE INDEX "custom_oauth_providers_provider_type_idx" ON "auth"."custom_oauth_providers" (provider_type);

