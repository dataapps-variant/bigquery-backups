-- job_id: c2657ed5-9617-463b-82eb-f84e069ac8f7
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:51:06.223000+00:00
-- started: 2026-08-03T09:51:06.313000+00:00
-- ended: 2026-08-03T09:51:06.503000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickio_mindworksllc`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
