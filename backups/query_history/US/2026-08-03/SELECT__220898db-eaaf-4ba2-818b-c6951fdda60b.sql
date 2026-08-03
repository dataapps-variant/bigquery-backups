-- job_id: 220898db-eaaf-4ba2-818b-c6951fdda60b
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:45:22.815000+00:00
-- started: 2026-08-03T09:45:22.967000+00:00
-- ended: 2026-08-03T09:45:23.418000+00:00


    SELECT table_type, COUNT(*) as cnt
    FROM `variant-finance-data-project.Shared_JF_Data`.INFORMATION_SCHEMA.TABLES
    WHERE table_type IN ("VIEW","MATERIALIZED_VIEW")
    GROUP BY table_type
