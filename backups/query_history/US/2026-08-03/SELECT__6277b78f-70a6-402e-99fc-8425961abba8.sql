-- job_id: 6277b78f-70a6-402e-99fc-8425961abba8
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:38:38.672000+00:00
-- started: 2026-08-03T12:38:38.760000+00:00
-- ended: 2026-08-03T12:38:39.017000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.linkedin_ads_linkedin_ads_source`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
