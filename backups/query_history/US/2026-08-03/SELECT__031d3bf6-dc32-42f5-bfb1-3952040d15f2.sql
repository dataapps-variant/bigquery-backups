-- job_id: 031d3bf6-dc32-42f5-bfb1-3952040d15f2
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:32:57.578000+00:00
-- started: 2026-08-03T09:32:57.709000+00:00
-- ended: 2026-08-03T09:32:57.939000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.variant_finance_data_project_Sticky_Data_TEST_1`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
