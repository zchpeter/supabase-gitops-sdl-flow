CREATE TABLE "realtime"."messages" (
    "topic" text NOT NULL,
    "extension" text NOT NULL,
    "payload" jsonb,
    "event" text,
    "private" boolean DEFAULT false,
    "updated_at" timestamp(6) without time zone DEFAULT now() NOT NULL,
    "inserted_at" timestamp(6) without time zone DEFAULT now() NOT NULL,
    "id" uuid DEFAULT gen_random_uuid() NOT NULL,
    CONSTRAINT "messages_pkey" PRIMARY KEY (id, inserted_at)
);

CREATE INDEX "messages_inserted_at_topic_index" ON "realtime"."messages" (inserted_at DESC, topic) WHERE (extension = 'broadcast'::text) AND (private IS TRUE);

