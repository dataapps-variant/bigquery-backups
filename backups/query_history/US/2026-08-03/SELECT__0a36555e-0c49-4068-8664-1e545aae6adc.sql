-- job_id: 0a36555e-0c49-4068-8664-1e545aae6adc
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:50:08.523000+00:00
-- started: 2026-08-03T09:50:08.952000+00:00
-- ended: 2026-08-03T09:50:09.089000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Utilities`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
