-- job_id: 274d5487-b978-4de7-80c1-a30054c3c479
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:44:46.321000+00:00
-- started: 2026-08-03T09:44:46.493000+00:00
-- ended: 2026-08-03T09:44:46.746000+00:00


    SELECT table_type, COUNT(*) as cnt
    FROM `variant-finance-data-project.Ad_spend_data`.INFORMATION_SCHEMA.TABLES
    WHERE table_type IN ("VIEW","MATERIALIZED_VIEW")
    GROUP BY table_type
