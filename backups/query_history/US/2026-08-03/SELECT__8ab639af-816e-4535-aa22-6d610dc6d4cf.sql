-- job_id: 8ab639af-816e-4535-aa22-6d610dc6d4cf
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:30:01.762000+00:00
-- started: 2026-08-03T12:30:01.881000+00:00
-- ended: 2026-08-03T12:30:02.063000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.linkedin_ads`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
