-- job_id: 53829a60-33b7-4222-bd03-d033a2cc1257
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:03:58.674000+00:00
-- started: 2026-08-03T13:03:58.786000+00:00
-- ended: 2026-08-03T13:03:59.052000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.variant_finance_data_project_Sticky_Data_TEST_1`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
