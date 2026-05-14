CREATE TABLE "auth"."oauth_consents" (
    "id" uuid NOT NULL,
    "user_id" uuid NOT NULL,
    "client_id" uuid NOT NULL,
    "scopes" text NOT NULL,
    "granted_at" timestamp(6) with time zone DEFAULT now() NOT NULL,
    "revoked_at" timestamp(6) with time zone,
    CONSTRAINT "oauth_consents_pkey" PRIMARY KEY (id),
    CONSTRAINT "oauth_consents_user_client_unique" UNIQUE (user_id, client_id),
    CONSTRAINT "oauth_consents_revoked_after_granted" CHECK (revoked_at IS NULL OR revoked_at >= granted_at),
    CONSTRAINT "oauth_consents_scopes_length" CHECK (char_length(scopes) <= 2048),
    CONSTRAINT "oauth_consents_scopes_not_empty" CHECK (char_length(TRIM(BOTH FROM scopes)) > 0),
    CONSTRAINT "oauth_consents_client_id_fkey" FOREIGN KEY ("client_id") REFERENCES "auth"."oauth_clients" ("id") ON DELETE CASCADE,
    CONSTRAINT "oauth_consents_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users" ("id") ON DELETE CASCADE
);

CREATE INDEX "oauth_consents_active_client_idx" ON "auth"."oauth_consents" (client_id) WHERE revoked_at IS NULL;

CREATE INDEX "oauth_consents_active_user_client_idx" ON "auth"."oauth_consents" (user_id, client_id) WHERE revoked_at IS NULL;

CREATE INDEX "oauth_consents_user_order_idx" ON "auth"."oauth_consents" (user_id, granted_at DESC);

