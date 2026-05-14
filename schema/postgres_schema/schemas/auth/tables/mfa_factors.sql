CREATE TABLE "auth"."mfa_factors" (
    "id" uuid NOT NULL,
    "user_id" uuid NOT NULL,
    "friendly_name" text,
    "factor_type" auth.factor_type NOT NULL,
    "status" auth.factor_status NOT NULL,
    "created_at" timestamp(6) with time zone NOT NULL,
    "updated_at" timestamp(6) with time zone NOT NULL,
    "secret" text,
    "phone" text,
    "last_challenged_at" timestamp(6) with time zone,
    "web_authn_credential" jsonb,
    "web_authn_aaguid" uuid,
    "last_webauthn_challenge_data" jsonb,
    CONSTRAINT "mfa_factors_pkey" PRIMARY KEY (id),
    CONSTRAINT "mfa_factors_last_challenged_at_key" UNIQUE (last_challenged_at),
    CONSTRAINT "mfa_factors_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users" ("id") ON DELETE CASCADE
);

COMMENT ON TABLE "auth"."mfa_factors" IS 'auth: stores metadata about factors';

COMMENT ON COLUMN "auth"."mfa_factors"."last_webauthn_challenge_data" IS 'Stores the latest WebAuthn challenge data including attestation/assertion for customer verification';

CREATE INDEX "factor_id_created_at_idx" ON "auth"."mfa_factors" (user_id, created_at);

CREATE UNIQUE INDEX "mfa_factors_user_friendly_name_unique" ON "auth"."mfa_factors" (friendly_name, user_id) WHERE TRIM(BOTH FROM friendly_name) <> ''::text;

CREATE INDEX "mfa_factors_user_id_idx" ON "auth"."mfa_factors" (user_id);

CREATE UNIQUE INDEX "unique_phone_factor_per_user" ON "auth"."mfa_factors" (user_id, phone);

