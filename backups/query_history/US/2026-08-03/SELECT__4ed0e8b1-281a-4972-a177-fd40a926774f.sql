-- job_id: 4ed0e8b1-281a-4972-a177-fd40a926774f
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:13:03.450000+00:00
-- started: 2026-08-03T09:13:03.550000+00:00
-- ended: 2026-08-03T09:13:03.731000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Tiktok_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
