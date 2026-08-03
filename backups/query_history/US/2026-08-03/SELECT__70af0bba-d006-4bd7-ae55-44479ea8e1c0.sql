-- job_id: 70af0bba-d006-4bd7-ae55-44479ea8e1c0
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:10:11.546000+00:00
-- started: 2026-08-03T09:10:11.651000+00:00
-- ended: 2026-08-03T09:10:11.841000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.MS_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
