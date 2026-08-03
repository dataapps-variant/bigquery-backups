-- job_id: e3a5c230-8c0d-41bc-8705-9fbb57bf9ca7
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:38:32.755000+00:00
-- started: 2026-08-03T12:38:32.842000+00:00
-- ended: 2026-08-03T12:38:33.015000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.linkedin_ads`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
