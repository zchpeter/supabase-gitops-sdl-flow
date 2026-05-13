
CREATE EVENT TRIGGER "issue_graphql_placeholder" ON sql_drop
  WHEN TAG IN ('DROP EXTENSION')
  EXECUTE FUNCTION "extensions"."set_graphql_placeholder"();


CREATE EVENT TRIGGER "issue_pg_cron_access" ON ddl_command_end
  WHEN TAG IN ('CREATE EXTENSION')
  EXECUTE FUNCTION "extensions"."grant_pg_cron_access"();


CREATE EVENT TRIGGER "issue_pg_graphql_access" ON ddl_command_end
  WHEN TAG IN ('CREATE FUNCTION')
  EXECUTE FUNCTION "extensions"."grant_pg_graphql_access"();


CREATE EVENT TRIGGER "issue_pg_net_access" ON ddl_command_end
  WHEN TAG IN ('CREATE EXTENSION')
  EXECUTE FUNCTION "extensions"."grant_pg_net_access"();


CREATE EVENT TRIGGER "pgrst_ddl_watch" ON ddl_command_end
  EXECUTE FUNCTION "extensions"."pgrst_ddl_watch"();


CREATE EVENT TRIGGER "pgrst_drop_watch" ON sql_drop
  EXECUTE FUNCTION "extensions"."pgrst_drop_watch"();

