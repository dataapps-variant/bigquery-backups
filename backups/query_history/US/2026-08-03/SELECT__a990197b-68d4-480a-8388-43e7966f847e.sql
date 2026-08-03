-- job_id: a990197b-68d4-480a-8388-43e7966f847e
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:03:00.017000+00:00
-- started: 2026-08-03T13:03:00.123000+00:00
-- ended: 2026-08-03T13:03:00.357000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Yahoo_Ads`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
