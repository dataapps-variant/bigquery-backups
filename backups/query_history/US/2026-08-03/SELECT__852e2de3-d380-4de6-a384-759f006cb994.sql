-- job_id: 852e2de3-d380-4de6-a384-759f006cb994
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:51:08.060000+00:00
-- started: 2026-08-03T11:51:08.176000+00:00
-- ended: 2026-08-03T11:51:08.465000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Cohort_Hunter`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
