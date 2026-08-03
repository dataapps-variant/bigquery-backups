-- job_id: 493eb88f-da15-4703-9e79-4b3cd4aa36f1
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:29:12.668000+00:00
-- started: 2026-08-03T12:29:12.747000+00:00
-- ended: 2026-08-03T12:29:13.569000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Sticky_Data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
