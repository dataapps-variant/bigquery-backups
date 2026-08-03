-- job_id: 3f1f2f1b-540a-4be2-91f3-ae268d2cee96
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:49:40.686000+00:00
-- started: 2026-08-03T09:49:40.748000+00:00
-- ended: 2026-08-03T09:49:40.964000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.R100`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
