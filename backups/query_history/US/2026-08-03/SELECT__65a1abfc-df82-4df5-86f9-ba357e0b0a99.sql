-- job_id: 65a1abfc-df82-4df5-86f9-ba357e0b0a99
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:20.639000+00:00
-- started: 2026-08-03T10:10:20.754000+00:00
-- ended: 2026-08-03T10:10:21.084000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.VPU`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
