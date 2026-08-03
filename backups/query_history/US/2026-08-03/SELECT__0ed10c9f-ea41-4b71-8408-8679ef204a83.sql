-- job_id: 0ed10c9f-ea41-4b71-8408-8679ef204a83
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:05:29.031000+00:00
-- started: 2026-08-03T09:05:29.105000+00:00
-- ended: 2026-08-03T09:05:29.295000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.VPU`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
