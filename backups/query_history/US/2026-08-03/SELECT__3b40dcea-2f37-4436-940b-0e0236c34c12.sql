-- job_id: 3b40dcea-2f37-4436-940b-0e0236c34c12
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:05:32.257000+00:00
-- started: 2026-08-03T09:05:32.340000+00:00
-- ended: 2026-08-03T09:05:32.529000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Verifications`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
