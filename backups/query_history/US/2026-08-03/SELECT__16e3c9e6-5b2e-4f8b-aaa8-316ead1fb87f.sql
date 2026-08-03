-- job_id: 16e3c9e6-5b2e-4f8b-aaa8-316ead1fb87f
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:51:19.135000+00:00
-- started: 2026-08-03T09:51:19.263000+00:00
-- ended: 2026-08-03T09:51:19.508000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.variant_finance_data_project_Sticky_Data_TEST_1`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
