CREATE TABLE "auth"."mfa_challenges" (
    "id" uuid NOT NULL,
    "factor_id" uuid NOT NULL,
    "created_at" timestamp(6) with time zone NOT NULL,
    "verified_at" timestamp(6) with time zone,
    "ip_address" inet NOT NULL,
    "otp_code" text,
    "web_authn_session_data" jsonb,
    CONSTRAINT "mfa_challenges_pkey" PRIMARY KEY (id),
    CONSTRAINT "mfa_challenges_auth_factor_id_fkey" FOREIGN KEY ("factor_id") REFERENCES "auth"."mfa_factors" ("id") ON DELETE CASCADE
);

COMMENT ON TABLE "auth"."mfa_challenges" IS 'auth: stores metadata about challenge requests made';

CREATE INDEX "mfa_challenge_created_at_idx" ON "auth"."mfa_challenges" (created_at DESC);

