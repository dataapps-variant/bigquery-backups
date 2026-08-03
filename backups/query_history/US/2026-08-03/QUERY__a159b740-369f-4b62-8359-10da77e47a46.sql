-- job_id: a159b740-369f-4b62-8359-10da77e47a46
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: None
-- created: 2026-08-03T09:44:06.546000+00:00
-- started: 2026-08-03T09:44:06.681000+00:00
-- ended: 2026-08-03T09:44:06.681000+00:00


SELECT table_schema, table_type, COUNT(*) as cnt
FROM `variant-finance-data-project`.INFORMATION_SCHEMA.TABLES
WHERE table_schema = "Ad_spend_data"
GROUP BY table_schema, table_type
