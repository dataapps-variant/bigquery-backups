-- job_id: 036c35f2-0691-4baa-add2-42ab44d1a745
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:51:12.375000+00:00
-- started: 2026-08-03T09:51:12.508000+00:00
-- ended: 2026-08-03T09:51:12.748000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickyio`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
