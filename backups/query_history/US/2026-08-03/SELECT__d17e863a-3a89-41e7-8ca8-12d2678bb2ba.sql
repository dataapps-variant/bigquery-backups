-- job_id: d17e863a-3a89-41e7-8ca8-12d2678bb2ba
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:39:06.632000+00:00
-- started: 2026-08-03T12:39:06.695000+00:00
-- ended: 2026-08-03T12:39:06.877000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.variant_finance_data_project_Sticky_Data_TEST_1`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
