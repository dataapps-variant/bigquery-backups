-- job_id: 73f3e628-99ca-4963-bd8b-9aae40fcf9c2
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:38:56.206000+00:00
-- started: 2026-08-03T12:38:56.294000+00:00
-- ended: 2026-08-03T12:38:56.486000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_pdfdotnet`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
