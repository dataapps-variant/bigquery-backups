-- job_id: a85309e8-e7ce-40eb-aad1-4bd300623a72
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:09.103000+00:00
-- started: 2026-08-03T10:11:09.198000+00:00
-- ended: 2026-08-03T10:11:09.360000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_brainable`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
