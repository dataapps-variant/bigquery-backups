-- job_id: 36d1bcae-9ab4-47c6-a440-e5c34fd9b3f4
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:30:13.046000+00:00
-- started: 2026-08-03T12:30:13.127000+00:00
-- ended: 2026-08-03T12:30:13.368000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickio_contractsdotnetllc`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
