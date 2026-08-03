-- job_id: b5e36bbb-7230-46d4-8fa6-5e36f709d806
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:53:29.562000+00:00
-- started: 2026-08-03T11:53:29.632000+00:00
-- ended: 2026-08-03T11:53:29.804000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_mindworksllc`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
