-- job_id: dc9a1a73-7704-41d0-a355-df35f2a0ac2a
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:52:09.268000+00:00
-- started: 2026-08-03T11:52:09.545000+00:00
-- ended: 2026-08-03T11:52:09.707000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Shared_PD_Data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
