-- job_id: 6e8e1997-f4f7-4c6a-8a27-33270f066b9c
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:49:34.535000+00:00
-- started: 2026-08-03T09:49:34.642000+00:00
-- ended: 2026-08-03T09:49:34.874000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.OpenAI_Ads`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
