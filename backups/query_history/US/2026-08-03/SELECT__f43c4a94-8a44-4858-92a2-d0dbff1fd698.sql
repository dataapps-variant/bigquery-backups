-- job_id: f43c4a94-8a44-4858-92a2-d0dbff1fd698
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:29:11.292000+00:00
-- started: 2026-08-03T12:29:11.352000+00:00
-- ended: 2026-08-03T12:29:11.529000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Spend_Data_Snapshot`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
