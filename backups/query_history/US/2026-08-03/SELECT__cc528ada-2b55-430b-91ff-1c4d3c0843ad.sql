-- job_id: cc528ada-2b55-430b-91ff-1c4d3c0843ad
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:46:14.660000+00:00
-- started: 2026-08-03T09:46:14.790000+00:00
-- ended: 2026-08-03T09:46:15.045000+00:00


    SELECT table_type, COUNT(*) as cnt
    FROM `variant-finance-data-project.variant_finance_data_project_Sticky_Data_TEST_1`.INFORMATION_SCHEMA.TABLES
    WHERE table_type IN ("VIEW","MATERIALIZED_VIEW")
    GROUP BY table_type
