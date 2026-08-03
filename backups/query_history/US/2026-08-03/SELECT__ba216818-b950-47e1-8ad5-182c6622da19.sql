-- job_id: ba216818-b950-47e1-8ad5-182c6622da19
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:06:00.674000+00:00
-- started: 2026-08-03T09:06:00.778000+00:00
-- ended: 2026-08-03T09:06:00.995000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickyio`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
