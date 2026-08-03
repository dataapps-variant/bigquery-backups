-- job_id: b0c94be8-0f55-40a3-9e26-43aaf691fadc
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:31:32.796000+00:00
-- started: 2026-08-03T09:31:32.945000+00:00
-- ended: 2026-08-03T09:31:33.157000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.CWC`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
