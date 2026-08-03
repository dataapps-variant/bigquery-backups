-- job_id: b5cfb279-4bda-4bb7-8cdc-ee0a129a6d30
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:45:49.235000+00:00
-- started: 2026-08-03T09:45:49.353000+00:00
-- ended: 2026-08-03T09:45:49.572000+00:00


    SELECT table_type, COUNT(*) as cnt
    FROM `variant-finance-data-project.dim_table`.INFORMATION_SCHEMA.TABLES
    WHERE table_type IN ("VIEW","MATERIALIZED_VIEW")
    GROUP BY table_type
