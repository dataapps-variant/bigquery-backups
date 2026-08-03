-- job_id: be363918-60bb-400e-ba23-b2718a08999f
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:50:51.636000+00:00
-- started: 2026-08-03T09:50:51.733000+00:00
-- ended: 2026-08-03T09:50:51.903000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.linkedin_ads_linkedin_ads_source`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
