-- job_id: 23e2b92a-24e6-40e3-b2ec-ae5ddc5b3be8
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:04.023000+00:00
-- started: 2026-08-03T10:09:04.143000+00:00
-- ended: 2026-08-03T10:09:04.414000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Extension_Scenario_Retention`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
