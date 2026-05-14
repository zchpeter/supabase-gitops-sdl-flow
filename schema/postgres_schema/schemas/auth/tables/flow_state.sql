CREATE TABLE "auth"."flow_state" (
    "id" uuid NOT NULL,
    "user_id" uuid,
    "auth_code" text,
    "code_challenge_method" auth.code_challenge_method,
    "code_challenge" text,
    "provider_type" text NOT NULL,
    "provider_access_token" text,
    "provider_refresh_token" text,
    "created_at" timestamp(6) with time zone,
    "updated_at" timestamp(6) with time zone,
    "authentication_method" text NOT NULL,
    "auth_code_issued_at" timestamp(6) with time zone,
    "invite_token" text,
    "referrer" text,
    "oauth_client_state_id" uuid,
    "linking_target_id" uuid,
    "email_optional" boolean DEFAULT false NOT NULL,
    CONSTRAINT "flow_state_pkey" PRIMARY KEY (id)
);

COMMENT ON TABLE "auth"."flow_state" IS 'Stores metadata for all OAuth/SSO login flows';

CREATE INDEX "flow_state_created_at_idx" ON "auth"."flow_state" (created_at DESC);

CREATE INDEX "idx_auth_code" ON "auth"."flow_state" (auth_code);

CREATE INDEX "idx_user_id_auth_method" ON "auth"."flow_state" (user_id, authentication_method);

