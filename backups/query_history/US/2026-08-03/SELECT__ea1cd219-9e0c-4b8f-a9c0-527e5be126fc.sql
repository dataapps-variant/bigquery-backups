-- job_id: ea1cd219-9e0c-4b8f-a9c0-527e5be126fc
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:51:20.994000+00:00
-- started: 2026-08-03T09:51:21.075000+00:00
-- ended: 2026-08-03T09:51:21.235000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.variant_finance_data_project_Sticky_Data_TEST_1`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
