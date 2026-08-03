-- job_id: e2d1184b-ba93-4326-8482-baae708d5432
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:04.171000+00:00
-- started: 2026-08-03T10:11:04.257000+00:00
-- ended: 2026-08-03T10:11:04.428000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.linkedin_ads_linkedin_ads_source`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
