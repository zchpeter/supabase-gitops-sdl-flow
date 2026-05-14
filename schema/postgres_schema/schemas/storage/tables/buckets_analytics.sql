CREATE TABLE "storage"."buckets_analytics" (
    "name" text NOT NULL,
    "type" storage.buckettype DEFAULT 'ANALYTICS'::storage.buckettype NOT NULL,
    "format" text DEFAULT 'ICEBERG'::text NOT NULL,
    "created_at" timestamp(6) with time zone DEFAULT now() NOT NULL,
    "updated_at" timestamp(6) with time zone DEFAULT now() NOT NULL,
    "id" uuid DEFAULT gen_random_uuid() NOT NULL,
    "deleted_at" timestamp(6) with time zone,
    CONSTRAINT "buckets_analytics_pkey" PRIMARY KEY (id)
);

CREATE UNIQUE INDEX "buckets_analytics_unique_name_idx" ON "storage"."buckets_analytics" (name) WHERE deleted_at IS NULL;

