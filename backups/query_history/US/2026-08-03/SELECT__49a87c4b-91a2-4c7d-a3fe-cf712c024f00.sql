-- job_id: 49a87c4b-91a2-4c7d-a3fe-cf712c024f00
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:30:09.509000+00:00
-- started: 2026-08-03T12:30:09.604000+00:00
-- ended: 2026-08-03T12:30:10.387000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickio_brainable`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
