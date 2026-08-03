-- job_id: 046d908d-431e-42a6-9be8-050086f184e6
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:30:28.387000+00:00
-- started: 2026-08-03T12:30:28.503000+00:00
-- ended: 2026-08-03T12:30:28.738000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickyio`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
