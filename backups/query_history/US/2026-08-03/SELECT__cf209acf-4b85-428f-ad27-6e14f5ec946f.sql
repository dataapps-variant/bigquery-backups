-- job_id: cf209acf-4b85-428f-ad27-6e14f5ec946f
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:51:54.176000+00:00
-- started: 2026-08-03T11:51:54.267000+00:00
-- ended: 2026-08-03T11:51:54.497000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.OpenAI_Ads`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
