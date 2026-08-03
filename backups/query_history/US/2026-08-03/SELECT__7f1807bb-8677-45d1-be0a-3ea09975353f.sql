-- job_id: 7f1807bb-8677-45d1-be0a-3ea09975353f
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:29:26.012000+00:00
-- started: 2026-08-03T12:29:26.125000+00:00
-- ended: 2026-08-03T12:29:26.437000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Utilities`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
