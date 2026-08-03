-- job_id: 66826d5b-4dc6-4b83-b5bd-fd6add17aaab
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:38:51.875000+00:00
-- started: 2026-08-03T12:38:51.983000+00:00
-- ended: 2026-08-03T12:38:52.216000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickio_mindworksllc`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
