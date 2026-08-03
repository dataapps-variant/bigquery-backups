-- job_id: b55d3a66-8cf7-40a9-b0df-a2efaa75c6d1
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:07.616000+00:00
-- started: 2026-08-03T10:11:07.692000+00:00
-- ended: 2026-08-03T10:11:07.940000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickio_brainable`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
