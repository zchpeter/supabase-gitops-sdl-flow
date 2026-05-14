CREATE TABLE "realtime"."subscription" (
    "id" bigint GENERATED ALWAYS AS IDENTITY,
    "subscription_id" uuid NOT NULL,
    "entity" regclass NOT NULL,
    "filters" _user_defined_filter DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    "claims" jsonb NOT NULL,
    "claims_role" regrole NOT NULL,
    "created_at" timestamp(6) without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    "action_filter" text DEFAULT '*'::text,
    CONSTRAINT "pk_subscription" PRIMARY KEY (id),
    CONSTRAINT "subscription_action_filter_check" CHECK (action_filter = ANY (ARRAY['*'::text, 'INSERT'::text, 'UPDATE'::text, 'DELETE'::text]))
);

CREATE INDEX "ix_realtime_subscription_entity" ON "realtime"."subscription" (entity);

CREATE UNIQUE INDEX "subscription_subscription_id_entity_filters_action_filter_key" ON "realtime"."subscription" (subscription_id, entity, filters, action_filter);

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();

