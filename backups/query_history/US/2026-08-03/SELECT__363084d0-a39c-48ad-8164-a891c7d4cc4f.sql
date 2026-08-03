-- job_id: 363084d0-a39c-48ad-8164-a891c7d4cc4f
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:45.530000+00:00
-- started: 2026-08-03T10:09:45.635000+00:00
-- ended: 2026-08-03T10:09:45.917000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.MS_ad_spend_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
