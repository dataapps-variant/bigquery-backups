-- job_id: 88d12945-a194-42a2-b617-d1b9e97c8990
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:26.212000+00:00
-- started: 2026-08-03T10:10:26.298000+00:00
-- ended: 2026-08-03T10:10:26.689000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.VPU_Merged`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
