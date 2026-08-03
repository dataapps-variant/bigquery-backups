-- job_id: e9cd3f1a-55cf-487d-8d5d-3ed69a12fd64
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:52:00.725000+00:00
-- started: 2026-08-03T11:52:00.837000+00:00
-- ended: 2026-08-03T11:52:01.087000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.R100`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
