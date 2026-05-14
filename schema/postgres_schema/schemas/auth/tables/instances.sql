CREATE TABLE "auth"."instances" (
    "id" uuid NOT NULL,
    "uuid" uuid,
    "raw_base_config" text,
    "created_at" timestamp(6) with time zone,
    "updated_at" timestamp(6) with time zone,
    CONSTRAINT "instances_pkey" PRIMARY KEY (id)
);

COMMENT ON TABLE "auth"."instances" IS 'Auth: Manages users across multiple sites.';

