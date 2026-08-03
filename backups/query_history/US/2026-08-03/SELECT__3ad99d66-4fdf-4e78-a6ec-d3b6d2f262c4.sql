-- job_id: 3ad99d66-4fdf-4e78-a6ec-d3b6d2f262c4
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:05:11.566000+00:00
-- started: 2026-08-03T09:05:11.661000+00:00
-- ended: 2026-08-03T09:05:11.883000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Quora_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
