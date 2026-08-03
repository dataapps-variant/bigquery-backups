-- job_id: fee18e72-b93e-49a0-847d-7f714de6bc13
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:10.007000+00:00
-- started: 2026-08-03T10:10:10.149000+00:00
-- ended: 2026-08-03T10:10:10.371000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Sticky_Reports`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
