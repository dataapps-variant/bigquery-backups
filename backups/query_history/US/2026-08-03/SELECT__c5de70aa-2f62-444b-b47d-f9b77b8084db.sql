-- job_id: c5de70aa-2f62-444b-b47d-f9b77b8084db
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:05:06.427000+00:00
-- started: 2026-08-03T09:05:06.531000+00:00
-- ended: 2026-08-03T09:05:06.701000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Linkedin_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
