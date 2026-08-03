-- job_id: 7c0654d1-2d86-4fb9-a3a9-b8d1b4dc93ee
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:06.077000+00:00
-- started: 2026-08-03T10:11:06.160000+00:00
-- ended: 2026-08-03T10:11:06.420000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickio_brainable`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
