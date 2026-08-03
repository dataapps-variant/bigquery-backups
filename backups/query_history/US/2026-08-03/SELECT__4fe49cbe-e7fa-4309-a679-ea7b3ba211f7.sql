-- job_id: 4fe49cbe-e7fa-4309-a679-ea7b3ba211f7
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:52:27.223000+00:00
-- started: 2026-08-03T11:52:27.305000+00:00
-- ended: 2026-08-03T11:52:27.479000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Tiktok_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
