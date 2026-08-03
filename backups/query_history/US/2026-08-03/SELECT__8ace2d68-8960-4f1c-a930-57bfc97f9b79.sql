-- job_id: 8ace2d68-8960-4f1c-a930-57bfc97f9b79
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:02:38.290000+00:00
-- started: 2026-08-03T13:02:38.426000+00:00
-- ended: 2026-08-03T13:02:38.704000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Sticky_Reports`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
