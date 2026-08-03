-- job_id: 4bace7fa-7f50-4f73-83e4-b13c38b0caeb
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:13:25.769000+00:00
-- started: 2026-08-03T09:13:25.856000+00:00
-- ended: 2026-08-03T09:13:26.055000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.linkedin_ads_linkedin_ads_source`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
