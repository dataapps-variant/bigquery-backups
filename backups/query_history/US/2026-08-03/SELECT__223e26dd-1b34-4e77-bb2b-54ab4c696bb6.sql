-- job_id: 223e26dd-1b34-4e77-bb2b-54ab4c696bb6
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:30:17.624000+00:00
-- started: 2026-08-03T12:30:17.673000+00:00
-- ended: 2026-08-03T12:30:17.862000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_formsourcellc`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
