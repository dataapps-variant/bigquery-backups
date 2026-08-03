-- job_id: 3bffa2ac-4696-4040-9e6c-305ee6a1bec2
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:10:24.836000+00:00
-- started: 2026-08-03T09:10:24.933000+00:00
-- ended: 2026-08-03T09:10:25.095000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Sticky_Data_Snapshots`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
