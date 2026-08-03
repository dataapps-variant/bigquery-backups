-- job_id: e167d8d4-985d-42fa-b0b6-f4c912cb8777
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:30.125000+00:00
-- started: 2026-08-03T10:09:30.214000+00:00
-- ended: 2026-08-03T10:09:30.452000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Icarus_Cohort`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
