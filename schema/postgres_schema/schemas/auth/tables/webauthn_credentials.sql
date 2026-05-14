CREATE TABLE "auth"."webauthn_credentials" (
    "id" uuid DEFAULT gen_random_uuid() NOT NULL,
    "user_id" uuid NOT NULL,
    "credential_id" bytea NOT NULL,
    "public_key" bytea NOT NULL,
    "attestation_type" text DEFAULT ''::text NOT NULL,
    "aaguid" uuid,
    "sign_count" bigint DEFAULT 0 NOT NULL,
    "transports" jsonb DEFAULT '[]'::jsonb NOT NULL,
    "backup_eligible" boolean DEFAULT false NOT NULL,
    "backed_up" boolean DEFAULT false NOT NULL,
    "friendly_name" text DEFAULT ''::text NOT NULL,
    "created_at" timestamp(6) with time zone DEFAULT now() NOT NULL,
    "updated_at" timestamp(6) with time zone DEFAULT now() NOT NULL,
    "last_used_at" timestamp(6) with time zone,
    CONSTRAINT "webauthn_credentials_pkey" PRIMARY KEY (id),
    CONSTRAINT "webauthn_credentials_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users" ("id") ON DELETE CASCADE
);

CREATE UNIQUE INDEX "webauthn_credentials_credential_id_key" ON "auth"."webauthn_credentials" (credential_id);

CREATE INDEX "webauthn_credentials_user_id_idx" ON "auth"."webauthn_credentials" (user_id);

