-- job_id: b9308607-6b96-4924-8b21-faa99d04409e
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:05:49.423000+00:00
-- started: 2026-08-03T09:05:49.527000+00:00
-- ended: 2026-08-03T09:05:49.711000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.linkedin_ads_linkedin_ads_source`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
