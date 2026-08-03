-- job_id: 54764a94-93c9-4bea-81fe-c1845a4bb005
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:49:58.928000+00:00
-- started: 2026-08-03T09:49:59.024000+00:00
-- ended: 2026-08-03T09:49:59.187000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Sticky_Data_Snapshots`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
