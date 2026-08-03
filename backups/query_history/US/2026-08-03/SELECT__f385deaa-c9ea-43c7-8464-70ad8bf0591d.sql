-- job_id: f385deaa-c9ea-43c7-8464-70ad8bf0591d
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:17.515000+00:00
-- started: 2026-08-03T10:10:17.573000+00:00
-- ended: 2026-08-03T10:10:17.761000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Sticky_Data_Snapshots`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
