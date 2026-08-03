-- job_id: ebb3105e-6804-4f84-9a9a-1636051d576d
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:05:25.385000+00:00
-- started: 2026-08-03T09:05:25.551000+00:00
-- ended: 2026-08-03T09:05:25.784000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Tiktok_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
