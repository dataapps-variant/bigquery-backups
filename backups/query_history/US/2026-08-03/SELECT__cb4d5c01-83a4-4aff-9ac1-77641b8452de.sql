-- job_id: cb4d5c01-83a4-4aff-9ac1-77641b8452de
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:32:10+00:00
-- started: 2026-08-03T09:32:10.114000+00:00
-- ended: 2026-08-03T09:32:10.312000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Shared_JF_Data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
