-- job_id: 48923b96-b7f5-4ddb-b5ea-784dd708a36c
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:19.778000+00:00
-- started: 2026-08-03T10:11:19.874000+00:00
-- ended: 2026-08-03T10:11:20.129000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickio_mindworksllc`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
