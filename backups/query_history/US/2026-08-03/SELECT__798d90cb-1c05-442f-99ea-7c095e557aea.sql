-- job_id: 798d90cb-1c05-442f-99ea-7c095e557aea
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:50:33.294000+00:00
-- started: 2026-08-03T09:50:33.347000+00:00
-- ended: 2026-08-03T09:50:33.505000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.demo_practise`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
