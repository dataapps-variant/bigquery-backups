-- job_id: f0eef43f-8f16-4bd8-be15-e86c6864e5fa
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:26.815000+00:00
-- started: 2026-08-03T10:11:26.915000+00:00
-- ended: 2026-08-03T10:11:27.215000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickyio`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
