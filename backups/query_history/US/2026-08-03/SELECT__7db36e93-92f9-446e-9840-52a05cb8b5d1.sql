-- job_id: 7db36e93-92f9-446e-9840-52a05cb8b5d1
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:37:14.685000+00:00
-- started: 2026-08-03T12:37:14.781000+00:00
-- ended: 2026-08-03T12:37:14.972000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Icarus_Spend_Country_AFID`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
