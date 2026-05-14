CREATE TABLE "storage"."buckets_vectors" (
    "id" text NOT NULL,
    "type" storage.buckettype DEFAULT 'VECTOR'::storage.buckettype NOT NULL,
    "created_at" timestamp(6) with time zone DEFAULT now() NOT NULL,
    "updated_at" timestamp(6) with time zone DEFAULT now() NOT NULL,
    CONSTRAINT "buckets_vectors_pkey" PRIMARY KEY (id)
);

