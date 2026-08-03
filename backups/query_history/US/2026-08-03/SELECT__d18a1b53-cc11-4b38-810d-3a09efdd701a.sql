-- job_id: d18a1b53-cc11-4b38-810d-3a09efdd701a
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:30:35.300000+00:00
-- started: 2026-08-03T12:30:35.396000+00:00
-- ended: 2026-08-03T12:30:35.662000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.variant_finance_data_project_Sticky_Data_TEST_1`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
