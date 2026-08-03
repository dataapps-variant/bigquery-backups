-- job_id: c0099554-e15b-4290-88ec-bf0e3daa0d7a
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:49:39.137000+00:00
-- started: 2026-08-03T09:49:39.208000+00:00
-- ended: 2026-08-03T09:49:39.417000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Quora_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
