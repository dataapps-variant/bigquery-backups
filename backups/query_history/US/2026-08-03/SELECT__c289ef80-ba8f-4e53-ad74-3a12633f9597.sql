-- job_id: c289ef80-ba8f-4e53-ad74-3a12633f9597
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:31:34.555000+00:00
-- started: 2026-08-03T09:31:34.691000+00:00
-- ended: 2026-08-03T09:31:35.051000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Clicks_Data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
