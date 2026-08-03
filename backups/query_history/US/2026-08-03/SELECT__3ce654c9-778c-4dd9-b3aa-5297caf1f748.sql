-- job_id: 3ce654c9-778c-4dd9-b3aa-5297caf1f748
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:02:17.408000+00:00
-- started: 2026-08-03T13:02:17.533000+00:00
-- ended: 2026-08-03T13:02:17.943000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.R100`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
