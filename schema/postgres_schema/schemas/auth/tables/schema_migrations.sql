CREATE TABLE "auth"."schema_migrations" (
    "version" character varying(255) NOT NULL,
    CONSTRAINT "schema_migrations_pkey" PRIMARY KEY (version)
);

COMMENT ON TABLE "auth"."schema_migrations" IS 'Auth: Manages updates to the auth system.';

