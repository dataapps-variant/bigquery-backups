-- job_id: 6b614fda-fc36-493a-b9a9-e60f811d4e87
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:32:19.763000+00:00
-- started: 2026-08-03T09:32:19.870000+00:00
-- ended: 2026-08-03T09:32:20.068000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Tiktok_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
