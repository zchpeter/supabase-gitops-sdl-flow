CREATE TABLE "auth"."identities" (
    "provider_id" text NOT NULL,
    "user_id" uuid NOT NULL,
    "identity_data" jsonb NOT NULL,
    "provider" text NOT NULL,
    "last_sign_in_at" timestamp(6) with time zone,
    "created_at" timestamp(6) with time zone,
    "updated_at" timestamp(6) with time zone,
    "email" text,
    "id" uuid DEFAULT gen_random_uuid() NOT NULL,
    CONSTRAINT "identities_pkey" PRIMARY KEY (id),
    CONSTRAINT "identities_provider_id_provider_unique" UNIQUE (provider_id, provider),
    CONSTRAINT "identities_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users" ("id") ON DELETE CASCADE
);

COMMENT ON TABLE "auth"."identities" IS 'Auth: Stores identities associated to a user.';

COMMENT ON COLUMN "auth"."identities"."email" IS 'Auth: Email is a generated column that references the optional email property in the identity_data';

CREATE INDEX "identities_email_idx" ON "auth"."identities" (email text_pattern_ops);

CREATE INDEX "identities_user_id_idx" ON "auth"."identities" (user_id);

COMMENT ON INDEX "auth"."identities_email_idx" IS 'Auth: Ensures indexed queries on the email column';

