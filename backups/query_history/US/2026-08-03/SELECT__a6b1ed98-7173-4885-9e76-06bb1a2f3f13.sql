-- job_id: a6b1ed98-7173-4885-9e76-06bb1a2f3f13
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:37:57.575000+00:00
-- started: 2026-08-03T12:37:57.686000+00:00
-- ended: 2026-08-03T12:37:57.919000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Utilities`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
