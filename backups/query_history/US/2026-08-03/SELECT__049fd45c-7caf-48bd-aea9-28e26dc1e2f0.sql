-- job_id: 049fd45c-7caf-48bd-aea9-28e26dc1e2f0
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:08:49.469000+00:00
-- started: 2026-08-03T10:08:49.646000+00:00
-- ended: 2026-08-03T10:08:49.889000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Ad_spend_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
