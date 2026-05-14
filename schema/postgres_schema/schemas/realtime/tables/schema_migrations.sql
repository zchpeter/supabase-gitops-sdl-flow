CREATE TABLE "realtime"."schema_migrations" (
    "version" bigint NOT NULL,
    "inserted_at" timestamp(0) without time zone,
    CONSTRAINT "schema_migrations_pkey" PRIMARY KEY (version)
);

