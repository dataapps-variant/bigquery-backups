-- job_id: cb183a6f-9b74-4232-8c0d-1b7c2c53608f
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:28:43.460000+00:00
-- started: 2026-08-03T12:28:43.522000+00:00
-- ended: 2026-08-03T12:28:43.761000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Icarus_Spend_Country_AFID`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
