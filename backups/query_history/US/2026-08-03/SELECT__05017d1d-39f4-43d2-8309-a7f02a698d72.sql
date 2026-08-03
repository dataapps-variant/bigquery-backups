-- job_id: 05017d1d-39f4-43d2-8309-a7f02a698d72
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:01.762000+00:00
-- started: 2026-08-03T10:09:01.855000+00:00
-- ended: 2026-08-03T10:09:02.014000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Extension_Refunds_Scenarios`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
