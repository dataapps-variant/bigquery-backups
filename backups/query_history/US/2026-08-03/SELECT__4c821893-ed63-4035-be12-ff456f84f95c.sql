-- job_id: 4c821893-ed63-4035-be12-ff456f84f95c
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:22.330000+00:00
-- started: 2026-08-03T10:09:22.468000+00:00
-- ended: 2026-08-03T10:09:22.713000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Icarus_Cohort`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
