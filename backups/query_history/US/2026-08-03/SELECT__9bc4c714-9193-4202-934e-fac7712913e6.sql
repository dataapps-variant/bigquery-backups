-- job_id: 9bc4c714-9193-4202-934e-fac7712913e6
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:50:53.165000+00:00
-- started: 2026-08-03T09:50:53.262000+00:00
-- ended: 2026-08-03T09:50:53.494000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickio_brainable`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
