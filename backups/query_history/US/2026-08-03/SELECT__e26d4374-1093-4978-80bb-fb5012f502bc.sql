-- job_id: e26d4374-1093-4978-80bb-fb5012f502bc
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:05:04.853000+00:00
-- started: 2026-08-03T09:05:04.961000+00:00
-- ended: 2026-08-03T09:05:05.139000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.LMC`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
