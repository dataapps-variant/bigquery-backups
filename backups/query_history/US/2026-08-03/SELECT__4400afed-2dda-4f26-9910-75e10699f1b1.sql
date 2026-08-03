-- job_id: 4400afed-2dda-4f26-9910-75e10699f1b1
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:05:21.996000+00:00
-- started: 2026-08-03T09:05:22.097000+00:00
-- ended: 2026-08-03T09:05:22.269000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Sticky_Data_Snapshots`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
