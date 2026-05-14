CREATE TABLE "auth"."one_time_tokens" (
    "id" uuid NOT NULL,
    "user_id" uuid NOT NULL,
    "token_type" auth.one_time_token_type NOT NULL,
    "token_hash" text NOT NULL,
    "relates_to" text NOT NULL,
    "created_at" timestamp(6) without time zone DEFAULT now() NOT NULL,
    "updated_at" timestamp(6) without time zone DEFAULT now() NOT NULL,
    CONSTRAINT "one_time_tokens_pkey" PRIMARY KEY (id),
    CONSTRAINT "one_time_tokens_token_hash_check" CHECK (char_length(token_hash) > 0),
    CONSTRAINT "one_time_tokens_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users" ("id") ON DELETE CASCADE
);

CREATE INDEX "one_time_tokens_relates_to_hash_idx" ON "auth"."one_time_tokens" USING HASH (relates_to);

CREATE INDEX "one_time_tokens_token_hash_hash_idx" ON "auth"."one_time_tokens" USING HASH (token_hash);

CREATE UNIQUE INDEX "one_time_tokens_user_id_token_type_key" ON "auth"."one_time_tokens" (user_id, token_type);

