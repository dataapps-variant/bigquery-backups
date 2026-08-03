-- job_id: 798431a9-8188-419d-bf38-3965d1cbb3b7
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:10:50.798000+00:00
-- started: 2026-08-03T09:10:50.901000+00:00
-- ended: 2026-08-03T09:10:51.063000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.linkedin_ads_linkedin_ads_source`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
