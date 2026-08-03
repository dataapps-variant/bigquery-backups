-- job_id: 21a34158-f275-4b66-b707-1307ff10b8ac
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:38:57.714000+00:00
-- started: 2026-08-03T12:38:57.796000+00:00
-- ended: 2026-08-03T12:38:58.253000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickyio`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
