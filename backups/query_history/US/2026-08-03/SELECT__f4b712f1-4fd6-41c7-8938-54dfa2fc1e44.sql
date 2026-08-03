-- job_id: f4b712f1-4fd6-41c7-8938-54dfa2fc1e44
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:53:42.740000+00:00
-- started: 2026-08-03T11:53:42.814000+00:00
-- ended: 2026-08-03T11:53:42.991000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.variant_finance_data_project_Sticky_Data_TEST_1`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
