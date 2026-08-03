-- job_id: 38b08324-6b6d-4af8-ac43-3ea8b02bcb62
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:06:04.892000+00:00
-- started: 2026-08-03T09:06:05.005000+00:00
-- ended: 2026-08-03T09:06:05.166000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.variant_finance_data_project_Sticky_Data_TEST_1`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
