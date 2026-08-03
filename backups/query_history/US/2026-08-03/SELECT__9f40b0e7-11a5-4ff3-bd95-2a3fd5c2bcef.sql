-- job_id: 9f40b0e7-11a5-4ff3-bd95-2a3fd5c2bcef
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:34.902000+00:00
-- started: 2026-08-03T10:11:34.964000+00:00
-- ended: 2026-08-03T10:11:35.130000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.variant_finance_data_project_Sticky_Data_TEST_1`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
