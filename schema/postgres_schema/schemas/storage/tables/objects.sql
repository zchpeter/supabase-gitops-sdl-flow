CREATE TABLE "storage"."objects" (
    "id" uuid DEFAULT gen_random_uuid() NOT NULL,
    "bucket_id" text,
    "name" text,
    "owner" uuid,
    "created_at" timestamp(6) with time zone DEFAULT now(),
    "updated_at" timestamp(6) with time zone DEFAULT now(),
    "last_accessed_at" timestamp(6) with time zone DEFAULT now(),
    "metadata" jsonb,
    "path_tokens" _text,
    "version" text,
    "owner_id" text,
    "user_metadata" jsonb,
    CONSTRAINT "objects_pkey" PRIMARY KEY (id),
    CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY ("bucket_id") REFERENCES "storage"."buckets" ("id")
);

COMMENT ON COLUMN "storage"."objects"."owner" IS 'Field is deprecated, use owner_id instead';

CREATE UNIQUE INDEX "bucketid_objname" ON "storage"."objects" (bucket_id, name);

CREATE INDEX "idx_objects_bucket_id_name" ON "storage"."objects" (bucket_id, name);

CREATE INDEX "idx_objects_bucket_id_name_lower" ON "storage"."objects" (bucket_id, lower(name));

CREATE INDEX "name_prefix_search" ON "storage"."objects" (name text_pattern_ops);

CREATE TRIGGER protect_objects_delete BEFORE DELETE ON storage.objects FOR EACH STATEMENT EXECUTE FUNCTION storage.protect_delete();

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();

