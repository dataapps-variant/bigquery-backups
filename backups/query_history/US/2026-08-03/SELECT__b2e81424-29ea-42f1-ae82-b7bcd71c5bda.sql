-- job_id: b2e81424-29ea-42f1-ae82-b7bcd71c5bda
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:13:23.943000+00:00
-- started: 2026-08-03T09:13:24.035000+00:00
-- ended: 2026-08-03T09:13:24.473000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.linkedin_ads_linkedin_ads`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
