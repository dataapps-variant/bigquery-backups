-- job_id: 8968bbba-b69f-4af0-882e-487d22a7e927
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:39:04.923000+00:00
-- started: 2026-08-03T12:39:05.039000+00:00
-- ended: 2026-08-03T12:39:05.312000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.variant_finance_data_project_Sticky_Data_TEST_1`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
