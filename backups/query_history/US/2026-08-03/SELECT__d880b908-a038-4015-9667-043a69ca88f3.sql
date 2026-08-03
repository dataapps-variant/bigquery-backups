-- job_id: d880b908-a038-4015-9667-043a69ca88f3
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:36.414000+00:00
-- started: 2026-08-03T10:11:36.494000+00:00
-- ended: 2026-08-03T10:11:36.652000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.variant_finance_data_project_Sticky_Data_TEST_1`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
