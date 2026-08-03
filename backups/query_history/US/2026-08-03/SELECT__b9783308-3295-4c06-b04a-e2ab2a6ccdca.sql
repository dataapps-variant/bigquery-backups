-- job_id: b9783308-3295-4c06-b04a-e2ab2a6ccdca
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:53:49.362000+00:00
-- started: 2026-08-03T11:53:49.435000+00:00
-- ended: 2026-08-03T11:53:49.615000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
