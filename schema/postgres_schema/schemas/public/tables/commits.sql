CREATE TABLE "public"."commits" (
    "id" bigint NOT NULL,
    "message" character varying NOT NULL,
    "repo_id" bigint NOT NULL,
    "author_id" bigint NOT NULL,
    CONSTRAINT "commits_pkey" PRIMARY KEY (id),
    CONSTRAINT "author_id" FOREIGN KEY ("author_id") REFERENCES "public"."users" ("id"),
    CONSTRAINT "repo_id" FOREIGN KEY ("repo_id") REFERENCES "public"."repos" ("id")
);

