-- job_id: 331252a2-b3b2-415c-9b90-87acecbc3fdf
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:46.720000+00:00
-- started: 2026-08-03T10:10:46.781000+00:00
-- ended: 2026-08-03T10:10:47.011000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.demo_practise`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
