-- job_id: 0b33a2a9-fcb0-4e40-b8a3-5d80b53c7647
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:12:57.037000+00:00
-- started: 2026-08-03T09:12:57.135000+00:00
-- ended: 2026-08-03T09:12:57.333000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Spend_Data_Snapshot`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
