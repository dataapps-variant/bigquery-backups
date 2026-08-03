-- job_id: 68abec03-b983-4608-998e-3117ab9610c8
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:37:34.043000+00:00
-- started: 2026-08-03T12:37:34.124000+00:00
-- ended: 2026-08-03T12:37:34.286000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.R100`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
