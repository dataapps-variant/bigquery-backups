-- job_id: 000fbaa8-fa1c-4309-86bb-878f8bf46fb5
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:07.651000+00:00
-- started: 2026-08-03T10:11:07.739000+00:00
-- ended: 2026-08-03T10:11:07.938000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_brainable`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
