-- job_id: a2483e87-ecd8-41ee-abd0-3a9dd7b56426
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:49:16.418000+00:00
-- started: 2026-08-03T09:49:16.527000+00:00
-- ended: 2026-08-03T09:49:16.760000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Icarus_Cohort`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
