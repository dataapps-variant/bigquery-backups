-- job_id: 6f73357b-5fd5-4c20-ae85-752576b42da0
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:51:10.963000+00:00
-- started: 2026-08-03T09:51:11.057000+00:00
-- ended: 2026-08-03T09:51:11.262000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_pdfdotnet`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
