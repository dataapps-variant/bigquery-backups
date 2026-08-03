-- job_id: 1ef04615-bfbf-4b8f-8aa1-12f34734fc8b
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:32:43.273000+00:00
-- started: 2026-08-03T09:32:43.383000+00:00
-- ended: 2026-08-03T09:32:43.573000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.linkedin_ads_linkedin_ads_source`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
