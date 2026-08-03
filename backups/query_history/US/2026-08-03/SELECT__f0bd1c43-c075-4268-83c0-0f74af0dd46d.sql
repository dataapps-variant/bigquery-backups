-- job_id: f0bd1c43-c075-4268-83c0-0f74af0dd46d
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:41.714000+00:00
-- started: 2026-08-03T10:10:41.859000+00:00
-- ended: 2026-08-03T10:10:42.057000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.demo_practise`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
