-- job_id: 70229dfd-874c-450c-ad6d-9c186e9e8f0a
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:50:05.336000+00:00
-- started: 2026-08-03T09:50:05.421000+00:00
-- ended: 2026-08-03T09:50:05.613000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Tiktok_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
