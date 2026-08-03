-- job_id: 29c11447-8fc5-47cb-8cd1-19366d34c4d2
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:01:34.842000+00:00
-- started: 2026-08-03T13:01:34.923000+00:00
-- ended: 2026-08-03T13:01:35.087000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Extension_Refunds_Scenarios`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
