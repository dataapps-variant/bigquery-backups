-- job_id: 7dff6dc1-e408-4df0-b87b-487095c3af95
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:30:26.888000+00:00
-- started: 2026-08-03T12:30:26.994000+00:00
-- ended: 2026-08-03T12:30:27.203000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_pdfdotnet`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
