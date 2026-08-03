-- job_id: 6005a8b7-96db-4cfd-80aa-e1edcf7fd234
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:37:21.585000+00:00
-- started: 2026-08-03T12:37:21.685000+00:00
-- ended: 2026-08-03T12:37:21.832000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Linkedin_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
