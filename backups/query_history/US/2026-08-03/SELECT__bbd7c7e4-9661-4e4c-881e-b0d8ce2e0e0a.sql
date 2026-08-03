-- job_id: bbd7c7e4-9661-4e4c-881e-b0d8ce2e0e0a
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:10:10.055000+00:00
-- started: 2026-08-03T09:10:10.155000+00:00
-- ended: 2026-08-03T09:10:10.354000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Linkedin_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
