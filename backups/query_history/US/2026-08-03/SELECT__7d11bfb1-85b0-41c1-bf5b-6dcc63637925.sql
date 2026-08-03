-- job_id: 7d11bfb1-85b0-41c1-bf5b-6dcc63637925
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:32:41.671000+00:00
-- started: 2026-08-03T09:32:41.753000+00:00
-- ended: 2026-08-03T09:32:41.939000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.linkedin_ads_linkedin_ads`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
