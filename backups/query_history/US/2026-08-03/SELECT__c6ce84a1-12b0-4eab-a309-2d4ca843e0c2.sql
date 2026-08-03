-- job_id: c6ce84a1-12b0-4eab-a309-2d4ca843e0c2
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:09.621000+00:00
-- started: 2026-08-03T10:09:09.691000+00:00
-- ended: 2026-08-03T10:09:09.843000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Decline_Reason`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
