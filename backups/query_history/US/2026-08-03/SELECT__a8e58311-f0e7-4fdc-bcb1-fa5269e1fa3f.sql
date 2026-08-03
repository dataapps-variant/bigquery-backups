-- job_id: a8e58311-f0e7-4fdc-bcb1-fa5269e1fa3f
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:52:12.670000+00:00
-- started: 2026-08-03T11:52:12.782000+00:00
-- ended: 2026-08-03T11:52:13.185000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Spend_Data_Snapshot`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
