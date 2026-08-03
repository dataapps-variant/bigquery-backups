-- job_id: 0b6045c3-0f4f-4bdd-bf0e-40dd1be75ba9
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:13:40.344000+00:00
-- started: 2026-08-03T09:13:40.450000+00:00
-- ended: 2026-08-03T09:13:40.635000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.variant_finance_data_project_Sticky_Data_TEST_1`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
