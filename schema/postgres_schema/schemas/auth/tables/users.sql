CREATE TABLE "auth"."users" (
    "instance_id" uuid,
    "id" uuid NOT NULL,
    "aud" character varying(255),
    "role" character varying(255),
    "email" character varying(255),
    "encrypted_password" character varying(255),
    "email_confirmed_at" timestamp(6) with time zone,
    "invited_at" timestamp(6) with time zone,
    "confirmation_token" character varying(255),
    "confirmation_sent_at" timestamp(6) with time zone,
    "recovery_token" character varying(255),
    "recovery_sent_at" timestamp(6) with time zone,
    "email_change_token_new" character varying(255),
    "email_change" character varying(255),
    "email_change_sent_at" timestamp(6) with time zone,
    "last_sign_in_at" timestamp(6) with time zone,
    "raw_app_meta_data" jsonb,
    "raw_user_meta_data" jsonb,
    "is_super_admin" boolean,
    "created_at" timestamp(6) with time zone,
    "updated_at" timestamp(6) with time zone,
    "phone" text DEFAULT NULL::character varying,
    "phone_confirmed_at" timestamp(6) with time zone,
    "phone_change" text DEFAULT ''::character varying,
    "phone_change_token" character varying(255) DEFAULT ''::character varying,
    "phone_change_sent_at" timestamp(6) with time zone,
    "confirmed_at" timestamp(6) with time zone,
    "email_change_token_current" character varying(255) DEFAULT ''::character varying,
    "email_change_confirm_status" smallint DEFAULT 0,
    "banned_until" timestamp(6) with time zone,
    "reauthentication_token" character varying(255) DEFAULT ''::character varying,
    "reauthentication_sent_at" timestamp(6) with time zone,
    "is_sso_user" boolean DEFAULT false NOT NULL,
    "deleted_at" timestamp(6) with time zone,
    "is_anonymous" boolean DEFAULT false NOT NULL,
    CONSTRAINT "users_pkey" PRIMARY KEY (id),
    CONSTRAINT "users_phone_key" UNIQUE (phone),
    CONSTRAINT "users_email_change_confirm_status_check" CHECK (email_change_confirm_status >= 0 AND email_change_confirm_status <= 2)
);

COMMENT ON TABLE "auth"."users" IS 'Auth: Stores user login data within a secure schema.';

COMMENT ON COLUMN "auth"."users"."is_sso_user" IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';

CREATE UNIQUE INDEX "confirmation_token_idx" ON "auth"."users" (confirmation_token) WHERE (confirmation_token)::text !~ '^[0-9 ]*$'::text;

CREATE UNIQUE INDEX "email_change_token_current_idx" ON "auth"."users" (email_change_token_current) WHERE (email_change_token_current)::text !~ '^[0-9 ]*$'::text;

CREATE UNIQUE INDEX "email_change_token_new_idx" ON "auth"."users" (email_change_token_new) WHERE (email_change_token_new)::text !~ '^[0-9 ]*$'::text;

CREATE UNIQUE INDEX "reauthentication_token_idx" ON "auth"."users" (reauthentication_token) WHERE (reauthentication_token)::text !~ '^[0-9 ]*$'::text;

CREATE UNIQUE INDEX "recovery_token_idx" ON "auth"."users" (recovery_token) WHERE (recovery_token)::text !~ '^[0-9 ]*$'::text;

CREATE UNIQUE INDEX "users_email_partial_key" ON "auth"."users" (email) WHERE is_sso_user = false;

CREATE INDEX "users_instance_id_email_idx" ON "auth"."users" (instance_id, lower(email::text));

CREATE INDEX "users_instance_id_idx" ON "auth"."users" (instance_id);

CREATE INDEX "users_is_anonymous_idx" ON "auth"."users" (is_anonymous);

