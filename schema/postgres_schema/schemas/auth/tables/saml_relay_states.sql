CREATE TABLE "auth"."saml_relay_states" (
    "id" uuid NOT NULL,
    "sso_provider_id" uuid NOT NULL,
    "request_id" text NOT NULL,
    "for_email" text,
    "redirect_to" text,
    "created_at" timestamp(6) with time zone,
    "updated_at" timestamp(6) with time zone,
    "flow_state_id" uuid,
    CONSTRAINT "saml_relay_states_pkey" PRIMARY KEY (id),
    CONSTRAINT "request_id not empty" CHECK (char_length(request_id) > 0),
    CONSTRAINT "saml_relay_states_flow_state_id_fkey" FOREIGN KEY ("flow_state_id") REFERENCES "auth"."flow_state" ("id") ON DELETE CASCADE,
    CONSTRAINT "saml_relay_states_sso_provider_id_fkey" FOREIGN KEY ("sso_provider_id") REFERENCES "auth"."sso_providers" ("id") ON DELETE CASCADE
);

COMMENT ON TABLE "auth"."saml_relay_states" IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';

CREATE INDEX "saml_relay_states_created_at_idx" ON "auth"."saml_relay_states" (created_at DESC);

CREATE INDEX "saml_relay_states_for_email_idx" ON "auth"."saml_relay_states" (for_email);

CREATE INDEX "saml_relay_states_sso_provider_id_idx" ON "auth"."saml_relay_states" (sso_provider_id);

