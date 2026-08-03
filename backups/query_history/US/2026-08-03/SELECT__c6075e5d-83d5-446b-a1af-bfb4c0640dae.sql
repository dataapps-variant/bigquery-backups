-- job_id: c6075e5d-83d5-446b-a1af-bfb4c0640dae
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:57.340000+00:00
-- started: 2026-08-03T10:09:57.463000+00:00
-- ended: 2026-08-03T10:09:57.658000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.R100`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
