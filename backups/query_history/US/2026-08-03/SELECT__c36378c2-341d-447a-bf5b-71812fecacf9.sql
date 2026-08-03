-- job_id: c36378c2-341d-447a-bf5b-71812fecacf9
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:29:27.666000+00:00
-- started: 2026-08-03T12:29:27.729000+00:00
-- ended: 2026-08-03T12:29:27.896000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Utilities`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
