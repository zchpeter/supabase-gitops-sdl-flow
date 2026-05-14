CREATE TABLE "auth"."oauth_client_states" (
    "id" uuid NOT NULL,
    "provider_type" text NOT NULL,
    "code_verifier" text,
    "created_at" timestamp(6) with time zone NOT NULL,
    CONSTRAINT "oauth_client_states_pkey" PRIMARY KEY (id)
);

COMMENT ON TABLE "auth"."oauth_client_states" IS 'Stores OAuth states for third-party provider authentication flows where Supabase acts as the OAuth client.';

CREATE INDEX "idx_oauth_client_states_created_at" ON "auth"."oauth_client_states" (created_at);

