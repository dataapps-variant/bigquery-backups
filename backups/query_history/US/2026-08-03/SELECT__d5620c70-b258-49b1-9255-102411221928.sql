-- job_id: d5620c70-b258-49b1-9255-102411221928
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:36:40.803000+00:00
-- started: 2026-08-03T12:36:40.947000+00:00
-- ended: 2026-08-03T12:36:41.225000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Cohort_Hunter`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
