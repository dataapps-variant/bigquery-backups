-- job_id: f35f8054-a9ff-4e34-ae94-4a6ba6c5e6cf
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:38:35.734000+00:00
-- started: 2026-08-03T12:38:35.800000+00:00
-- ended: 2026-08-03T12:38:35.987000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.linkedin_ads_linkedin_ads`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
