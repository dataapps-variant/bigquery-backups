-- job_id: a15b72b4-e99f-4919-becb-6949f29853f5
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:03:45.114000+00:00
-- started: 2026-08-03T13:03:45.235000+00:00
-- ended: 2026-08-03T13:03:45.512000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickio_mindworksllc`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
