-- job_id: 36909a0d-ec85-4aa5-b145-3a921c0b51f0
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:12:28.157000+00:00
-- started: 2026-08-03T09:12:28.275000+00:00
-- ended: 2026-08-03T09:12:28.438000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Extension_Refunds_Scenarios`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
