-- job_id: 6c6e29ee-2b97-4abb-aef1-2a803f238342
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:29:19.655000+00:00
-- started: 2026-08-03T12:29:20.088000+00:00
-- ended: 2026-08-03T12:29:20.343000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Sticky_Reports`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
