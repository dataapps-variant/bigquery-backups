-- job_id: e6c6a1bf-8294-4a89-9510-9988ccae6f3c
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:29:08.227000+00:00
-- started: 2026-08-03T12:29:08.284000+00:00
-- ended: 2026-08-03T12:29:08.528000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Shared_PD_Data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
