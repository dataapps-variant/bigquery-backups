-- job_id: 0b806e21-97d9-4eed-8765-d52ac78f717c
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:28:37.249000+00:00
-- started: 2026-08-03T12:28:37.352000+00:00
-- ended: 2026-08-03T12:28:37.607000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Icarus_Cohort`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
