-- job_id: 430157e4-7ba6-439a-a98f-3630d08a286e
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:01:20.314000+00:00
-- started: 2026-08-03T13:01:20.455000+00:00
-- ended: 2026-08-03T13:01:20.703000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Clicks_Data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
