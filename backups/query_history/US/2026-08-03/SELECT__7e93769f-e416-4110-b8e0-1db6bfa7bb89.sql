-- job_id: 7e93769f-e416-4110-b8e0-1db6bfa7bb89
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:28:58.777000+00:00
-- started: 2026-08-03T12:28:58.859000+00:00
-- ended: 2026-08-03T12:28:59.056000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Quora_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
