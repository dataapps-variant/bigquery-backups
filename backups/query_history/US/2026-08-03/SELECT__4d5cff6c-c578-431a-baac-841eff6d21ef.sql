-- job_id: 4d5cff6c-c578-431a-baac-841eff6d21ef
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:11:07.262000+00:00
-- started: 2026-08-03T09:11:07.344000+00:00
-- ended: 2026-08-03T09:11:07.553000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.variant_finance_data_project_Sticky_Data_TEST_1`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
