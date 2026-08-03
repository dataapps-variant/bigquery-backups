-- job_id: d1ca3500-6505-49c1-a7e5-887c4757c8d3
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:28:24.217000+00:00
-- started: 2026-08-03T12:28:24.296000+00:00
-- ended: 2026-08-03T12:28:24.548000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Extension_Scenario_Retention`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
