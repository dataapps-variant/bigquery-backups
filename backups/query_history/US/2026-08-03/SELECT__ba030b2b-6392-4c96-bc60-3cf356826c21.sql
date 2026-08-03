-- job_id: ba030b2b-6392-4c96-bc60-3cf356826c21
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:04:00.250000+00:00
-- started: 2026-08-03T13:04:00.310000+00:00
-- ended: 2026-08-03T13:04:00.510000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.variant_finance_data_project_Sticky_Data_TEST_1`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
