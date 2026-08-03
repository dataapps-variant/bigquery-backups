-- job_id: f6716464-c336-4dab-9c2c-f7c494d1b38d
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:03:50.424000+00:00
-- started: 2026-08-03T13:03:50.513000+00:00
-- ended: 2026-08-03T13:03:50.758000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_pdfdotnet`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
