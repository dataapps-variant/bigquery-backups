-- job_id: 0eaa56fc-0b9a-4f4b-bd37-43fe9bec7e4d
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:49:01.357000+00:00
-- started: 2026-08-03T09:49:01.492000+00:00
-- ended: 2026-08-03T09:49:01.718000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Extension_Scenario_Retention`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
