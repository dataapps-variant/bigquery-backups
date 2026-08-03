-- job_id: 8ab5f07d-a4fa-4561-9818-2accc61cad88
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:51:21.281000+00:00
-- started: 2026-08-03T11:51:21.420000+00:00
-- ended: 2026-08-03T11:51:21.674000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Extension_Scenario_Retention`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
