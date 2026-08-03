-- job_id: b40e1176-1338-4d41-b1ed-aea51d5b2085
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:44:20.051000+00:00
-- started: 2026-08-03T09:44:20.189000+00:00
-- ended: 2026-08-03T09:44:20.361000+00:00


SELECT table_type, COUNT(*) as cnt
FROM `variant-finance-data-project.Ad_spend_data`.INFORMATION_SCHEMA.TABLES
GROUP BY table_type
