CREATE TABLE "auth"."refresh_tokens" (
    "instance_id" uuid,
    "id" bigserial,
    "token" character varying(255),
    "user_id" character varying(255),
    "revoked" boolean,
    "created_at" timestamp(6) with time zone,
    "updated_at" timestamp(6) with time zone,
    "parent" character varying(255),
    "session_id" uuid,
    CONSTRAINT "refresh_tokens_pkey" PRIMARY KEY (id),
    CONSTRAINT "refresh_tokens_token_unique" UNIQUE (token),
    CONSTRAINT "refresh_tokens_session_id_fkey" FOREIGN KEY ("session_id") REFERENCES "auth"."sessions" ("id") ON DELETE CASCADE
);

COMMENT ON TABLE "auth"."refresh_tokens" IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';

CREATE INDEX "refresh_tokens_instance_id_idx" ON "auth"."refresh_tokens" (instance_id);

CREATE INDEX "refresh_tokens_instance_id_user_id_idx" ON "auth"."refresh_tokens" (instance_id, user_id);

CREATE INDEX "refresh_tokens_parent_idx" ON "auth"."refresh_tokens" (parent);

CREATE INDEX "refresh_tokens_session_id_revoked_idx" ON "auth"."refresh_tokens" (session_id, revoked);

CREATE INDEX "refresh_tokens_updated_at_idx" ON "auth"."refresh_tokens" (updated_at DESC);

