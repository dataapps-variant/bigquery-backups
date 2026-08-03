-- job_id: c1a813fc-c83a-4acb-a9ba-03a16bc2901b
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:19.020000+00:00
-- started: 2026-08-03T10:10:19.135000+00:00
-- ended: 2026-08-03T10:10:19.418000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Sticky_Reports`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
