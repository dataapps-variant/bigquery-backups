-- job_id: bfcbb27c-bcbe-4d60-a18e-e07e88c5bb44
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:51:59.045000+00:00
-- started: 2026-08-03T11:51:59.161000+00:00
-- ended: 2026-08-03T11:51:59.325000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Quora_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
