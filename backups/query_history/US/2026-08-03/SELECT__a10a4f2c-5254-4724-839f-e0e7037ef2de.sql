-- job_id: a10a4f2c-5254-4724-839f-e0e7037ef2de
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:53:41.107000+00:00
-- started: 2026-08-03T11:53:41.225000+00:00
-- ended: 2026-08-03T11:53:41.489000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.variant_finance_data_project_Sticky_Data_TEST_1`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
