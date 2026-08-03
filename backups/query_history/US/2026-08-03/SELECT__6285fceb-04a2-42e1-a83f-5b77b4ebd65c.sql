-- job_id: 6285fceb-04a2-42e1-a83f-5b77b4ebd65c
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:02:36.681000+00:00
-- started: 2026-08-03T13:02:36.838000+00:00
-- ended: 2026-08-03T13:02:37.065000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Sticky_Data_Snapshots`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
