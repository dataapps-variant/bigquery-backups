-- job_id: 1ee9bf28-7d3e-45f9-9f97-ffedc0fc052f
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:28:27.157000+00:00
-- started: 2026-08-03T12:28:27.258000+00:00
-- ended: 2026-08-03T12:28:27.548000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Facbook_ad_spend_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
