-- job_id: 623f5fe5-b237-46d6-93b1-5b227dc598c5
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:12:47.126000+00:00
-- started: 2026-08-03T09:12:47.238000+00:00
-- ended: 2026-08-03T09:12:47.399000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.MS_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
