-- job_id: e018cc2b-6224-4023-a513-7c52cce44c82
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:52:22.302000+00:00
-- started: 2026-08-03T11:52:22.406000+00:00
-- ended: 2026-08-03T11:52:22.638000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Sticky_Reports`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
