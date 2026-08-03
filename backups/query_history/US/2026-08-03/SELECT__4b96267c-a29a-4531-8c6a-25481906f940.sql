-- job_id: 4b96267c-a29a-4531-8c6a-25481906f940
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:49.158000+00:00
-- started: 2026-08-03T10:09:49.272000+00:00
-- ended: 2026-08-03T10:09:49.479000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.OpenAI_Ads`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
