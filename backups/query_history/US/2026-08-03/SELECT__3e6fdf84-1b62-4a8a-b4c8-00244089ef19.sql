-- job_id: 3e6fdf84-1b62-4a8a-b4c8-00244089ef19
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:38:02.235000+00:00
-- started: 2026-08-03T12:38:02.345000+00:00
-- ended: 2026-08-03T12:38:02.588000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.VPU`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
