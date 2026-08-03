-- job_id: e070b5ea-28d6-4d93-a96b-16eb6981d82a
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:32:06.539000+00:00
-- started: 2026-08-03T09:32:06.651000+00:00
-- ended: 2026-08-03T09:32:06.840000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Quora_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
