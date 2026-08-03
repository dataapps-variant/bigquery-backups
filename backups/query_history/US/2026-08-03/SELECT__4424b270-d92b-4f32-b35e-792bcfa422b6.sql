-- job_id: 4424b270-d92b-4f32-b35e-792bcfa422b6
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:53:12.713000+00:00
-- started: 2026-08-03T11:53:12.787000+00:00
-- ended: 2026-08-03T11:53:12.967000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.linkedin_ads_linkedin_ads_source`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
