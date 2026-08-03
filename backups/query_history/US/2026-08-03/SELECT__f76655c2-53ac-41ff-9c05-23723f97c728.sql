-- job_id: f76655c2-53ac-41ff-9c05-23723f97c728
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:33.415000+00:00
-- started: 2026-08-03T10:11:33.496000+00:00
-- ended: 2026-08-03T10:11:33.721000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.variant_finance_data_project_Sticky_Data_TEST_1`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
