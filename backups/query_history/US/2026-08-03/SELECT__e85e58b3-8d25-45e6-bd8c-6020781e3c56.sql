-- job_id: e85e58b3-8d25-45e6-bd8c-6020781e3c56
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:15.615000+00:00
-- started: 2026-08-03T10:10:15.720000+00:00
-- ended: 2026-08-03T10:10:15.915000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Tiktok_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
