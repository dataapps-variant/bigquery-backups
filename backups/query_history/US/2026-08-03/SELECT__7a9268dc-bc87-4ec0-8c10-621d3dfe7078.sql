-- job_id: 7a9268dc-bc87-4ec0-8c10-621d3dfe7078
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:10:52.316000+00:00
-- started: 2026-08-03T09:10:52.396000+00:00
-- ended: 2026-08-03T09:10:52.644000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_brainable`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
