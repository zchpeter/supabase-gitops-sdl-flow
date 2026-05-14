CREATE TABLE "public"."repos" (
    "id" bigint NOT NULL,
    "name" character varying NOT NULL,
    "owner_id" bigint NOT NULL,
    "description" character varying,
    "created_at" timestamp(6) with time zone DEFAULT now(),
    CONSTRAINT "repos_pkey" PRIMARY KEY (id),
    CONSTRAINT "name" UNIQUE (owner_id, name),
    CONSTRAINT "owner_id" FOREIGN KEY ("owner_id") REFERENCES "public"."users" ("id")
);

