-- job_id: 1d0b3492-e5d2-401c-b8b3-5ee65b3f67f8
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:46:18.049000+00:00
-- started: 2026-08-03T09:46:18.223000+00:00
-- ended: 2026-08-03T09:46:18.456000+00:00


    SELECT table_type, COUNT(*) as cnt
    FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test`.INFORMATION_SCHEMA.TABLES
    WHERE table_type IN ("VIEW","MATERIALIZED_VIEW")
    GROUP BY table_type
