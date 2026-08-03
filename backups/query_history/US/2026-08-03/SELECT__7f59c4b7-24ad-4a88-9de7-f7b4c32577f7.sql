-- job_id: 7f59c4b7-24ad-4a88-9de7-f7b4c32577f7
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:12:42.203000+00:00
-- started: 2026-08-03T09:12:42.301000+00:00
-- ended: 2026-08-03T09:12:42.503000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Icarus_Spend_Country_AFID`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
