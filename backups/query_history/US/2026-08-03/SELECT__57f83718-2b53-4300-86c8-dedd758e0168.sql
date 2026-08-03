-- job_id: 57f83718-2b53-4300-86c8-dedd758e0168
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:37:56.024000+00:00
-- started: 2026-08-03T12:37:56.120000+00:00
-- ended: 2026-08-03T12:37:56.296000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Tiktok_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
