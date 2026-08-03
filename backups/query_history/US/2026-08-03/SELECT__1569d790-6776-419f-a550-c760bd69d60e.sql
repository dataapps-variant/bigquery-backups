-- job_id: 1569d790-6776-419f-a550-c760bd69d60e
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:01:36.387000+00:00
-- started: 2026-08-03T13:01:36.483000+00:00
-- ended: 2026-08-03T13:01:36.746000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Extension_Scenario_Retention`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
