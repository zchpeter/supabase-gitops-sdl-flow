CREATE TABLE "storage"."s3_multipart_uploads_parts" (
    "id" uuid DEFAULT gen_random_uuid() NOT NULL,
    "upload_id" text NOT NULL,
    "size" bigint DEFAULT 0 NOT NULL,
    "part_number" integer NOT NULL,
    "bucket_id" text NOT NULL,
    "key" text NOT NULL COLLATE "C",
    "etag" text NOT NULL,
    "owner_id" text,
    "version" text NOT NULL,
    "created_at" timestamp(6) with time zone DEFAULT now() NOT NULL,
    CONSTRAINT "s3_multipart_uploads_parts_pkey" PRIMARY KEY (id),
    CONSTRAINT "s3_multipart_uploads_parts_bucket_id_fkey" FOREIGN KEY ("bucket_id") REFERENCES "storage"."buckets" ("id"),
    CONSTRAINT "s3_multipart_uploads_parts_upload_id_fkey" FOREIGN KEY ("upload_id") REFERENCES "storage"."s3_multipart_uploads" ("id") ON DELETE CASCADE
);

