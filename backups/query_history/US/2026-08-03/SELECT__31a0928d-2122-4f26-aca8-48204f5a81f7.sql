-- job_id: 31a0928d-2122-4f26-aca8-48204f5a81f7
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:12:55.083000+00:00
-- started: 2026-08-03T09:12:55.203000+00:00
-- ended: 2026-08-03T09:12:55.377000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Shared_PD_Data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
