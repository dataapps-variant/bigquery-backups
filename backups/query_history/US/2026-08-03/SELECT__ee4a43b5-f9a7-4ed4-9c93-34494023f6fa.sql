-- job_id: ee4a43b5-f9a7-4ed4-9c93-34494023f6fa
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:31:56.917000+00:00
-- started: 2026-08-03T09:31:57.030000+00:00
-- ended: 2026-08-03T09:31:57.235000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Icarus_Spend_Country_AFID`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
