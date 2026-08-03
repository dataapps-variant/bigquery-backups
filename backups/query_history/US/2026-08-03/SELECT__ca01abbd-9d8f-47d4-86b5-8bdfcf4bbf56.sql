-- job_id: ca01abbd-9d8f-47d4-86b5-8bdfcf4bbf56
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:00.642000+00:00
-- started: 2026-08-03T10:09:00.755000+00:00
-- ended: 2026-08-03T10:09:01.059000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Cohort_Hunter`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
