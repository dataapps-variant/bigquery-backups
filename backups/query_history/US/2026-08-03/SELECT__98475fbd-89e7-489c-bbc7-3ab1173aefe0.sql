-- job_id: 98475fbd-89e7-489c-bbc7-3ab1173aefe0
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:48:47.799000+00:00
-- started: 2026-08-03T09:48:48.017000+00:00
-- ended: 2026-08-03T09:48:48.253000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Cohort_Hunter`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
