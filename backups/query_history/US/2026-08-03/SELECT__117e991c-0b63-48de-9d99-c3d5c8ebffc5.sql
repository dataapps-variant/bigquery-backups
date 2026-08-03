-- job_id: 117e991c-0b63-48de-9d99-c3d5c8ebffc5
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:00.965000+00:00
-- started: 2026-08-03T10:10:01.065000+00:00
-- ended: 2026-08-03T10:10:01.291000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Shared_JF_Data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
