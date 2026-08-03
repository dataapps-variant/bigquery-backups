-- job_id: 054e6549-baa9-485a-a7a4-c1e2a7a1df34
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:38:19.321000+00:00
-- started: 2026-08-03T12:38:19.460000+00:00
-- ended: 2026-08-03T12:38:19.680000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.demo_practise`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
