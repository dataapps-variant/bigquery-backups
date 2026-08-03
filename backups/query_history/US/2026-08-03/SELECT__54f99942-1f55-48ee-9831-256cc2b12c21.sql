-- job_id: 54f99942-1f55-48ee-9831-256cc2b12c21
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:48:45.993000+00:00
-- started: 2026-08-03T09:48:46.086000+00:00
-- ended: 2026-08-03T09:48:46.265000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Clicks_Data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
