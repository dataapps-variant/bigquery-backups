-- job_id: 6edf9bd0-c097-465a-b113-51e67d1388cb
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:51:42.744000+00:00
-- started: 2026-08-03T11:51:42.814000+00:00
-- ended: 2026-08-03T11:51:43.013000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Icarus_Spend_Country_AFID`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
