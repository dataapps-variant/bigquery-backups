-- job_id: 5e149cd7-518b-48c1-8c0b-ccd30b54b16e
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:05:16.934000+00:00
-- started: 2026-08-03T09:05:17.180000+00:00
-- ended: 2026-08-03T09:05:17.355000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Shared_PD_Data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
