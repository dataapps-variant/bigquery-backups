-- job_id: 68d3e512-b570-4507-bb97-dce863c13763
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:02:15.727000+00:00
-- started: 2026-08-03T13:02:15.837000+00:00
-- ended: 2026-08-03T13:02:16.032000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Quora_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
