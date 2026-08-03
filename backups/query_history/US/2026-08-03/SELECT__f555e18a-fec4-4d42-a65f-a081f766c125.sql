-- job_id: f555e18a-fec4-4d42-a65f-a081f766c125
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:43.433000+00:00
-- started: 2026-08-03T10:11:43.512000+00:00
-- ended: 2026-08-03T10:11:43.665000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
