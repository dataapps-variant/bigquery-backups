-- job_id: 6d8e7cca-0149-4e6a-a9c8-91c08d8da0ec
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:53:16.024000+00:00
-- started: 2026-08-03T11:53:16.109000+00:00
-- ended: 2026-08-03T11:53:16.321000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_brainable`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
