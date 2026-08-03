-- job_id: d9fe3653-451f-4480-b82b-2c46b7a0ec7a
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:49:22.532000+00:00
-- started: 2026-08-03T09:49:22.620000+00:00
-- ended: 2026-08-03T09:49:22.939000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Icarus_Spend_Country_AFID`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
