-- job_id: 2a4f18ca-b8d1-4b42-b2e3-07b5dfae681e
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:02:49.881000+00:00
-- started: 2026-08-03T13:02:49.984000+00:00
-- ended: 2026-08-03T13:02:50.288000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.VPU`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
