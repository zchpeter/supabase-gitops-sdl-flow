CREATE TABLE "public"."atlas_schema_revisions" (
    "version" character varying NOT NULL,
    "description" character varying NOT NULL,
    "type" bigint DEFAULT 2 NOT NULL,
    "applied" bigint DEFAULT 0 NOT NULL,
    "total" bigint DEFAULT 0 NOT NULL,
    "executed_at" timestamp(6) with time zone NOT NULL,
    "execution_time" bigint NOT NULL,
    "error" text,
    "error_stmt" text,
    "hash" character varying NOT NULL,
    "partial_hashes" jsonb,
    "operator_version" character varying NOT NULL,
    CONSTRAINT "atlas_schema_revisions_pkey" PRIMARY KEY (version)
);

