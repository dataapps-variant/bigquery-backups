-- job_id: 0fcf2c95-664d-401c-892c-2cee1a488c97
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:51:27.401000+00:00
-- started: 2026-08-03T09:51:27.483000+00:00
-- ended: 2026-08-03T09:51:27.666000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
