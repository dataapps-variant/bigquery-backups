-- job_id: ec935014-16bb-499b-b82b-58279ce7a323
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:02:29.345000+00:00
-- started: 2026-08-03T13:02:29.459000+00:00
-- ended: 2026-08-03T13:02:29.716000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Spend_Data_Snapshot`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
