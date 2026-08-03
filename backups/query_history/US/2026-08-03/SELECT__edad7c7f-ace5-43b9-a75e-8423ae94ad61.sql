-- job_id: edad7c7f-ace5-43b9-a75e-8423ae94ad61
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:48.995000+00:00
-- started: 2026-08-03T10:09:49.106000+00:00
-- ended: 2026-08-03T10:09:49.404000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.R100`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
