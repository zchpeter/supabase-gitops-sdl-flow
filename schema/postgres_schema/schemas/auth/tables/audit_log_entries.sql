CREATE TABLE "auth"."audit_log_entries" (
    "instance_id" uuid,
    "id" uuid NOT NULL,
    "payload" json,
    "created_at" timestamp(6) with time zone,
    "ip_address" character varying(64) DEFAULT ''::character varying NOT NULL,
    CONSTRAINT "audit_log_entries_pkey" PRIMARY KEY (id)
);

COMMENT ON TABLE "auth"."audit_log_entries" IS 'Auth: Audit trail for user actions.';

CREATE INDEX "audit_logs_instance_id_idx" ON "auth"."audit_log_entries" (instance_id);

