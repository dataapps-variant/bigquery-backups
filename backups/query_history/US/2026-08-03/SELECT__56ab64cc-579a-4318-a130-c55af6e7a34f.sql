-- job_id: 56ab64cc-579a-4318-a130-c55af6e7a34f
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:03:51.946000+00:00
-- started: 2026-08-03T13:03:52.067000+00:00
-- ended: 2026-08-03T13:03:52.305000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickyio`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
