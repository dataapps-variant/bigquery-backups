-- job_id: e1c57c93-9b1d-4d40-bbea-20ff88259ce3
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:08:47.581000+00:00
-- started: 2026-08-03T10:08:47.753000+00:00
-- ended: 2026-08-03T10:08:47.994000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Cohort_Hunter`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
