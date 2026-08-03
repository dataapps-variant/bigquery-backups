-- job_id: 4a13aab1-46f6-4e37-9286-7a6c046800b8
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:12:32.147000+00:00
-- started: 2026-08-03T09:12:32.267000+00:00
-- ended: 2026-08-03T09:12:32.484000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Facbook_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
