-- job_id: 89638af3-7004-435a-98e5-b13a1c9f2b3d
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:50:15.958000+00:00
-- started: 2026-08-03T09:50:16.060000+00:00
-- ended: 2026-08-03T09:50:16.342000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.VPU_Merged`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
