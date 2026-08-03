-- job_id: c6c2777a-532b-4c6c-a442-fe99e1f8df35
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:01:56.393000+00:00
-- started: 2026-08-03T13:01:56.502000+00:00
-- ended: 2026-08-03T13:01:56.749000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Icarus_Spend_Country_AFID`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
