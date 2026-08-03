-- job_id: 629f02d3-d12b-43e5-a906-d9b32f013b3b
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:49:48.632000+00:00
-- started: 2026-08-03T09:49:48.710000+00:00
-- ended: 2026-08-03T09:49:48.889000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Shared_PD_Data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
