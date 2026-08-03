-- job_id: 12fdc855-fa5b-41dc-863c-83acc28c2c45
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:50:50.079000+00:00
-- started: 2026-08-03T09:50:50.206000+00:00
-- ended: 2026-08-03T09:50:50.442000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.linkedin_ads_linkedin_ads_source`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
