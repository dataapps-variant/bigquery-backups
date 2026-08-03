-- job_id: 91a2a161-ceab-4c93-9be6-bd319471c88b
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:37.224000+00:00
-- started: 2026-08-03T10:09:37.334000+00:00
-- ended: 2026-08-03T10:09:37.562000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Icarus_Spend_Country_AFID`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
