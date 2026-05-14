CREATE TABLE "auth"."webauthn_challenges" (
    "id" uuid DEFAULT gen_random_uuid() NOT NULL,
    "user_id" uuid,
    "challenge_type" text NOT NULL,
    "session_data" jsonb NOT NULL,
    "created_at" timestamp(6) with time zone DEFAULT now() NOT NULL,
    "expires_at" timestamp(6) with time zone NOT NULL,
    CONSTRAINT "webauthn_challenges_pkey" PRIMARY KEY (id),
    CONSTRAINT "webauthn_challenges_challenge_type_check" CHECK (challenge_type = ANY (ARRAY['signup'::text, 'registration'::text, 'authentication'::text])),
    CONSTRAINT "webauthn_challenges_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "auth"."users" ("id") ON DELETE CASCADE
);

CREATE INDEX "webauthn_challenges_expires_at_idx" ON "auth"."webauthn_challenges" (expires_at);

CREATE INDEX "webauthn_challenges_user_id_idx" ON "auth"."webauthn_challenges" (user_id);

