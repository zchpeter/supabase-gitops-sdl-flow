CREATE TABLE "auth"."sessions" (
    "id" uuid NOT NULL,
    "user_id" uuid NOT NULL,
    "created_at" timestamp(6) with time zone,
    "updated_at" timestamp(6) with time zone,
    "factor_id" uuid,
    "aal" auth.aal_level,
    "not_after" timestamp(6) with time zone,
    "refreshed_at" timestamp(6) without time zone,
    "user_agent" text,
    "ip" inet,
    "tag" text,
    "oauth_client_id" uuid,
    "refresh_token_hmac_key" text,
    "refresh_token_counter" bigint,
    "scopes" text,
    CONSTRAINT "sessions_pkey" PRIMARY KEY (id),
    CONSTRAINT "sessions_scopes_length" CHECK (char_length(scopes) <= 4096),
    CONSTRAINT "sessions_oauth_client_id_fkey" FOREIGN KEY ("oauth_client_id") REFERENCES "auth"."oauth_clients" ("id") ON DELETE CASCADE,
    CONSTRAINT "sessions_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users" ("id") ON DELETE CASCADE
);

COMMENT ON TABLE "auth"."sessions" IS 'Auth: Stores session data associated to a user.';

COMMENT ON COLUMN "auth"."sessions"."not_after" IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';

COMMENT ON COLUMN "auth"."sessions"."refresh_token_hmac_key" IS 'Holds a HMAC-SHA256 key used to sign refresh tokens for this session.';

COMMENT ON COLUMN "auth"."sessions"."refresh_token_counter" IS 'Holds the ID (counter) of the last issued refresh token.';

CREATE INDEX "sessions_not_after_idx" ON "auth"."sessions" (not_after DESC);

CREATE INDEX "sessions_oauth_client_id_idx" ON "auth"."sessions" (oauth_client_id);

CREATE INDEX "sessions_user_id_idx" ON "auth"."sessions" (user_id);

CREATE INDEX "user_id_created_at_idx" ON "auth"."sessions" (user_id, created_at);

