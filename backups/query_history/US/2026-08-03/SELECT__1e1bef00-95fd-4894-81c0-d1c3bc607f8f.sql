-- job_id: 1e1bef00-95fd-4894-81c0-d1c3bc607f8f
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:36:53.891000+00:00
-- started: 2026-08-03T12:36:54.001000+00:00
-- ended: 2026-08-03T12:36:54.241000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Extension_Scenario_Retention`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
