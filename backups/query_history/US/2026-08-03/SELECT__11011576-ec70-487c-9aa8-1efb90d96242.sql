-- job_id: 11011576-ec70-487c-9aa8-1efb90d96242
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:04:51.308000+00:00
-- started: 2026-08-03T09:04:51.406000+00:00
-- ended: 2026-08-03T09:04:51.591000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Extension_Scenario_Retention`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
