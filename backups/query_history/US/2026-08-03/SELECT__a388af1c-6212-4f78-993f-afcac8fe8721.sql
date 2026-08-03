-- job_id: a388af1c-6212-4f78-993f-afcac8fe8721
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:52:52.124000+00:00
-- started: 2026-08-03T11:52:52.244000+00:00
-- ended: 2026-08-03T11:52:52.493000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.demo_practise`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
