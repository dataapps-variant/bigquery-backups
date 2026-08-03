-- job_id: aa5cc0c9-8eaa-41c3-b857-0afd727d9625
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:01.907000+00:00
-- started: 2026-08-03T10:11:01.995000+00:00
-- ended: 2026-08-03T10:11:02.215000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.linkedin_ads_linkedin_ads`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
