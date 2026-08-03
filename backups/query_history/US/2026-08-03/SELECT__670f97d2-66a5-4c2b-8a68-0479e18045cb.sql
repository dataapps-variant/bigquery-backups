-- job_id: 670f97d2-66a5-4c2b-8a68-0479e18045cb
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:10:28.253000+00:00
-- started: 2026-08-03T09:10:28.360000+00:00
-- ended: 2026-08-03T09:10:28.538000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Tiktok_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
