CREATE TABLE "storage"."vector_indexes" (
    "id" text DEFAULT gen_random_uuid() NOT NULL,
    "name" text NOT NULL COLLATE "C",
    "bucket_id" text NOT NULL,
    "data_type" text NOT NULL,
    "dimension" integer NOT NULL,
    "distance_metric" text NOT NULL,
    "metadata_configuration" jsonb,
    "created_at" timestamp(6) with time zone DEFAULT now() NOT NULL,
    "updated_at" timestamp(6) with time zone DEFAULT now() NOT NULL,
    CONSTRAINT "vector_indexes_pkey" PRIMARY KEY (id),
    CONSTRAINT "vector_indexes_bucket_id_fkey" FOREIGN KEY ("bucket_id") REFERENCES "storage"."buckets_vectors" ("id")
);

CREATE UNIQUE INDEX "vector_indexes_name_bucket_id_idx" ON "storage"."vector_indexes" (name, bucket_id);

