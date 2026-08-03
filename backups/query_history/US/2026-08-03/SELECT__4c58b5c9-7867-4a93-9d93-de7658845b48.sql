-- job_id: 4c58b5c9-7867-4a93-9d93-de7658845b48
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:29:40.649000+00:00
-- started: 2026-08-03T12:29:40.712000+00:00
-- ended: 2026-08-03T12:29:40.898000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Yahoo_Ads`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
