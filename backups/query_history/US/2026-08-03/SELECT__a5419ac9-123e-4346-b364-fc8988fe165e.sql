-- job_id: a5419ac9-123e-4346-b364-fc8988fe165e
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:51:04.698000+00:00
-- started: 2026-08-03T11:51:04.856000+00:00
-- ended: 2026-08-03T11:51:05.108000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Clicks_Data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
