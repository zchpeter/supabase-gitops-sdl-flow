CREATE TABLE "storage"."s3_multipart_uploads" (
    "id" text NOT NULL,
    "in_progress_size" bigint DEFAULT 0 NOT NULL,
    "upload_signature" text NOT NULL,
    "bucket_id" text NOT NULL,
    "key" text NOT NULL COLLATE "C",
    "version" text NOT NULL,
    "owner_id" text,
    "created_at" timestamp(6) with time zone DEFAULT now() NOT NULL,
    "user_metadata" jsonb,
    "metadata" jsonb,
    CONSTRAINT "s3_multipart_uploads_pkey" PRIMARY KEY (id),
    CONSTRAINT "s3_multipart_uploads_bucket_id_fkey" FOREIGN KEY ("bucket_id") REFERENCES "storage"."buckets" ("id")
);

CREATE INDEX "idx_multipart_uploads_list" ON "storage"."s3_multipart_uploads" (bucket_id, key, created_at);

