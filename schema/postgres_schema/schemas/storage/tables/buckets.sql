CREATE TABLE "storage"."buckets" (
    "id" text NOT NULL,
    "name" text NOT NULL,
    "owner" uuid,
    "created_at" timestamp(6) with time zone DEFAULT now(),
    "updated_at" timestamp(6) with time zone DEFAULT now(),
    "public" boolean DEFAULT false,
    "avif_autodetection" boolean DEFAULT false,
    "file_size_limit" bigint,
    "allowed_mime_types" _text,
    "owner_id" text,
    "type" storage.buckettype DEFAULT 'STANDARD'::storage.buckettype NOT NULL,
    CONSTRAINT "buckets_pkey" PRIMARY KEY (id)
);

COMMENT ON COLUMN "storage"."buckets"."owner" IS 'Field is deprecated, use owner_id instead';

CREATE UNIQUE INDEX "bname" ON "storage"."buckets" (name);

CREATE TRIGGER enforce_bucket_name_length_trigger BEFORE INSERT OR UPDATE OF name ON storage.buckets FOR EACH ROW EXECUTE FUNCTION storage.enforce_bucket_name_length();

CREATE TRIGGER protect_buckets_delete BEFORE DELETE ON storage.buckets FOR EACH STATEMENT EXECUTE FUNCTION storage.protect_delete();

