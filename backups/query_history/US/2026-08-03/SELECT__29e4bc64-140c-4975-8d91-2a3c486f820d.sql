-- job_id: 29e4bc64-140c-4975-8d91-2a3c486f820d
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:30:36.893000+00:00
-- started: 2026-08-03T12:30:36.974000+00:00
-- ended: 2026-08-03T12:30:37.141000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.variant_finance_data_project_Sticky_Data_TEST_1`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
