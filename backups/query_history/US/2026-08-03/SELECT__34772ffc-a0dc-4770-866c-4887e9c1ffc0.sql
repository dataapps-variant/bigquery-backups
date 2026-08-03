-- job_id: 34772ffc-a0dc-4770-866c-4887e9c1ffc0
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:32:16.654000+00:00
-- started: 2026-08-03T09:32:16.754000+00:00
-- ended: 2026-08-03T09:32:16.921000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Sticky_Data_Snapshots`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
