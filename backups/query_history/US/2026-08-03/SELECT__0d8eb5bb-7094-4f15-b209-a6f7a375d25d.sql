-- job_id: 0d8eb5bb-7094-4f15-b209-a6f7a375d25d
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:50:06.825000+00:00
-- started: 2026-08-03T09:50:06.910000+00:00
-- ended: 2026-08-03T09:50:07.257000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Utilities`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
