-- job_id: d5ba5275-c5c7-4145-b139-6c9f4cc22ad3
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:58.409000+00:00
-- started: 2026-08-03T10:10:58.510000+00:00
-- ended: 2026-08-03T10:10:58.774000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.linkedin_ads_linkedin_ads`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
