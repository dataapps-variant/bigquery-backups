-- job_id: a3ad0e6e-b437-4b5c-b9fe-2f152629357b
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:31:41.786000+00:00
-- started: 2026-08-03T09:31:41.882000+00:00
-- ended: 2026-08-03T09:31:42.097000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Extension_Refunds_Scenarios`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
