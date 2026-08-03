-- job_id: d3d3e143-f065-4f38-ba0f-2ebb9e36c326
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:03:53.638000+00:00
-- started: 2026-08-03T13:03:53.692000+00:00
-- ended: 2026-08-03T13:03:53.887000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickyio`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
