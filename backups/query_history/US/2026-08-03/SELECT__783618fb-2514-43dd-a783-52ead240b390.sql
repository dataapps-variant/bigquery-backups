-- job_id: 783618fb-2514-43dd-a783-52ead240b390
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:12:45.478000+00:00
-- started: 2026-08-03T09:12:45.590000+00:00
-- ended: 2026-08-03T09:12:45.769000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Linkedin_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
