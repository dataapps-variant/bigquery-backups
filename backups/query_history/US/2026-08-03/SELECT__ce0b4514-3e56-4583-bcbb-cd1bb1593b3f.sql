-- job_id: ce0b4514-3e56-4583-bcbb-cd1bb1593b3f
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:52:23.927000+00:00
-- started: 2026-08-03T11:52:24.071000+00:00
-- ended: 2026-08-03T11:52:24.241000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Sticky_Reports`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
