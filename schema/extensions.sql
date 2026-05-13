CREATE EXTENSION IF NOT EXISTS "pg_graphql" WITH SCHEMA "graphql" VERSION '1.5.11';

COMMENT ON EXTENSION "pg_graphql" IS 'pg_graphql: GraphQL support';


CREATE EXTENSION IF NOT EXISTS "pg_stat_statements" WITH SCHEMA "extensions" VERSION '1.11';

COMMENT ON EXTENSION "pg_stat_statements" IS 'track planning and execution statistics of all SQL statements executed';


CREATE EXTENSION IF NOT EXISTS "pgcrypto" WITH SCHEMA "extensions" VERSION '1.3';

COMMENT ON EXTENSION "pgcrypto" IS 'cryptographic functions';


CREATE EXTENSION IF NOT EXISTS "supabase_vault" WITH SCHEMA "vault" VERSION '0.3.1';

COMMENT ON EXTENSION "supabase_vault" IS 'Supabase Vault Extension';


CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA "extensions" VERSION '1.1';

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';

