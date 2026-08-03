-- job_id: 06ef5e00-a972-432c-8a39-6d4f6f9bc4fd
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:30:21.004000+00:00
-- started: 2026-08-03T12:30:21.054000+00:00
-- ended: 2026-08-03T12:30:21.226000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_jobflowllc`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
