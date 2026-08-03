-- job_id: ed9b3d29-4a5a-4c60-aebc-7a510bf5b00a
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:10:21.742000+00:00
-- started: 2026-08-03T09:10:21.836000+00:00
-- ended: 2026-08-03T09:10:22.034000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Spend_Data_Snapshot`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
