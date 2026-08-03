-- job_id: 2780ef06-ae4f-45f0-9501-9dce5cf90e83
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:02:05.571000+00:00
-- started: 2026-08-03T13:02:05.670000+00:00
-- ended: 2026-08-03T13:02:05.926000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Linkedin_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
