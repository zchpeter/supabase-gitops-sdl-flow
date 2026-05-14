CREATE TABLE "auth"."oauth_clients" (
    "id" uuid NOT NULL,
    "client_secret_hash" text,
    "registration_type" auth.oauth_registration_type NOT NULL,
    "redirect_uris" text NOT NULL,
    "grant_types" text NOT NULL,
    "client_name" text,
    "client_uri" text,
    "logo_uri" text,
    "created_at" timestamp(6) with time zone DEFAULT now() NOT NULL,
    "updated_at" timestamp(6) with time zone DEFAULT now() NOT NULL,
    "deleted_at" timestamp(6) with time zone,
    "client_type" auth.oauth_client_type DEFAULT 'confidential'::auth.oauth_client_type NOT NULL,
    "token_endpoint_auth_method" text NOT NULL,
    CONSTRAINT "oauth_clients_pkey" PRIMARY KEY (id),
    CONSTRAINT "oauth_clients_client_name_length" CHECK (char_length(client_name) <= 1024),
    CONSTRAINT "oauth_clients_client_uri_length" CHECK (char_length(client_uri) <= 2048),
    CONSTRAINT "oauth_clients_logo_uri_length" CHECK (char_length(logo_uri) <= 2048),
    CONSTRAINT "oauth_clients_token_endpoint_auth_method_check" CHECK (token_endpoint_auth_method = ANY (ARRAY['client_secret_basic'::text, 'client_secret_post'::text, 'none'::text]))
);

CREATE INDEX "oauth_clients_deleted_at_idx" ON "auth"."oauth_clients" (deleted_at);

