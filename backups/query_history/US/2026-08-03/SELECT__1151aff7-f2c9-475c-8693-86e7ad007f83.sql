-- job_id: 1151aff7-f2c9-475c-8693-86e7ad007f83
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:28:54.224000+00:00
-- started: 2026-08-03T12:28:54.305000+00:00
-- ended: 2026-08-03T12:28:54.583000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.OpenAI_Ads`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
