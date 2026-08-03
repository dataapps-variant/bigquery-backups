-- job_id: 1f2821fe-780e-4f74-9b65-1b4d5cf1ab13
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:36:34.168000+00:00
-- started: 2026-08-03T12:36:34.299000+00:00
-- ended: 2026-08-03T12:36:34.667000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.CWC`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
