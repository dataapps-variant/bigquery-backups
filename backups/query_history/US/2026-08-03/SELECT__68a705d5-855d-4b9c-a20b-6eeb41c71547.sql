-- job_id: 68a705d5-855d-4b9c-a20b-6eeb41c71547
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:49:51.565000+00:00
-- started: 2026-08-03T09:49:51.630000+00:00
-- ended: 2026-08-03T09:49:51.788000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Spend_Data_Snapshot`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
