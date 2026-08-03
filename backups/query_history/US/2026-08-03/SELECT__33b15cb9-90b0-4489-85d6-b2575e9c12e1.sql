-- job_id: 33b15cb9-90b0-4489-85d6-b2575e9c12e1
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:32:52.639000+00:00
-- started: 2026-08-03T09:32:52.738000+00:00
-- ended: 2026-08-03T09:32:52.875000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_pdfdotnet`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
