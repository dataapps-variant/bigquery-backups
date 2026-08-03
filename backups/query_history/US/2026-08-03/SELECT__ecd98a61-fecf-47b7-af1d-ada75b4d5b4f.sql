-- job_id: ecd98a61-fecf-47b7-af1d-ada75b4d5b4f
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:12:43.864000+00:00
-- started: 2026-08-03T09:12:43.962000+00:00
-- ended: 2026-08-03T09:12:44.151000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.LMC`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
