-- job_id: f8a86079-3ff1-4b39-b02c-08c835e2fd7f
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:48:44.330000+00:00
-- started: 2026-08-03T09:48:44.454000+00:00
-- ended: 2026-08-03T09:48:44.692000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Clicks_Data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
