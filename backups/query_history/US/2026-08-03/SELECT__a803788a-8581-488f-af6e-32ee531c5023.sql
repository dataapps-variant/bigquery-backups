-- job_id: a803788a-8581-488f-af6e-32ee531c5023
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:46:16.398000+00:00
-- started: 2026-08-03T09:46:16.539000+00:00
-- ended: 2026-08-03T09:46:16.777000+00:00


    SELECT table_type, COUNT(*) as cnt
    FROM `variant-finance-data-project.vatiant_finance_Google_Query_Snapshots`.INFORMATION_SCHEMA.TABLES
    WHERE table_type IN ("VIEW","MATERIALIZED_VIEW")
    GROUP BY table_type
