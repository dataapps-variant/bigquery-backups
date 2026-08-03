-- job_id: a2a0affc-43cb-474f-864d-0038f4486766
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:48:59.809000+00:00
-- started: 2026-08-03T09:48:59.909000+00:00
-- ended: 2026-08-03T09:49:00.063000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Extension_Refunds_Scenarios`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
