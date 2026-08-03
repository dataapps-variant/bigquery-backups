-- job_id: 6369b904-03ef-4ac2-bb85-98cb304e0f7c
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:05:30.569000+00:00
-- started: 2026-08-03T09:05:30.670000+00:00
-- ended: 2026-08-03T09:05:30.840000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.VPU_Merged`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
