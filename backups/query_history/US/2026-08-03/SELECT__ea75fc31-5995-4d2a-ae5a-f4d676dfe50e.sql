-- job_id: ea75fc31-5995-4d2a-ae5a-f4d676dfe50e
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:53:35.832000+00:00
-- started: 2026-08-03T11:53:35.907000+00:00
-- ended: 2026-08-03T11:53:36.070000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickyio`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
