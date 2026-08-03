-- job_id: a0a19dab-ac72-4899-9ca2-9ea0311c6a71
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:49:20.968000+00:00
-- started: 2026-08-03T09:49:21.121000+00:00
-- ended: 2026-08-03T09:49:21.341000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Icarus_Spend_Country_AFID`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
