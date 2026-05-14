CREATE TABLE "storage"."migrations" (
    "id" integer NOT NULL,
    "name" character varying(100) NOT NULL,
    "hash" character varying(40) NOT NULL,
    "executed_at" timestamp(6) without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "migrations_pkey" PRIMARY KEY (id),
    CONSTRAINT "migrations_name_key" UNIQUE (name)
);

