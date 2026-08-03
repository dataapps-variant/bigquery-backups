-- job_id: 018c0d0e-b243-4e08-ba5d-8ac140b06b55
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:26.252000+00:00
-- started: 2026-08-03T10:11:26.352000+00:00
-- ended: 2026-08-03T10:11:26.626000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickyio`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
