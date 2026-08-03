-- job_id: a1c491ef-c3e9-4d01-8bf3-d97330ddafdb
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:52:02.423000+00:00
-- started: 2026-08-03T11:52:02.503000+00:00
-- ended: 2026-08-03T11:52:02.718000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.R100`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
