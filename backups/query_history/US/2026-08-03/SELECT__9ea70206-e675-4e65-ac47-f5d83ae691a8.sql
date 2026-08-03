-- job_id: 9ea70206-e675-4e65-ac47-f5d83ae691a8
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:01:58.260000+00:00
-- started: 2026-08-03T13:01:58.357000+00:00
-- ended: 2026-08-03T13:01:58.608000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Icarus_Spend_Country_AFID`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
