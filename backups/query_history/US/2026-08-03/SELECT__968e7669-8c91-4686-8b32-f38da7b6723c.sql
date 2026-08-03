-- job_id: 968e7669-8c91-4686-8b32-f38da7b6723c
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:34.798000+00:00
-- started: 2026-08-03T10:11:34.889000+00:00
-- ended: 2026-08-03T10:11:35.090000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.variant_finance_data_project_Sticky_Data_TEST_1`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
