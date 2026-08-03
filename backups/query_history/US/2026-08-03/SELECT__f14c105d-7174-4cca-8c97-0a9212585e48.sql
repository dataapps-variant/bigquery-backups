-- job_id: f14c105d-7174-4cca-8c97-0a9212585e48
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:01:22.124000+00:00
-- started: 2026-08-03T13:01:22.271000+00:00
-- ended: 2026-08-03T13:01:22.513000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Cohort_Hunter`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
