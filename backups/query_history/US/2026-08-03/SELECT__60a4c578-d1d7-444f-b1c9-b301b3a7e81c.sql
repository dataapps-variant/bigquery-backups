-- job_id: 60a4c578-d1d7-444f-b1c9-b301b3a7e81c
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:57.440000+00:00
-- started: 2026-08-03T10:09:57.508000+00:00
-- ended: 2026-08-03T10:09:57.697000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Shared_PD_Data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
