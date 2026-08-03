-- job_id: f4fc733d-a7a0-46da-b3f4-3c7c6a3e506c
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:12:52.115000+00:00
-- started: 2026-08-03T09:12:52.204000+00:00
-- ended: 2026-08-03T09:12:52.389000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.R100`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
