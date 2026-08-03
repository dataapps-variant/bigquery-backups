-- job_id: 86f528ec-4597-4cff-9a58-dc0c8f9cfaec
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:05:27.032000+00:00
-- started: 2026-08-03T09:05:27.192000+00:00
-- ended: 2026-08-03T09:05:27.393000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Utilities`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
