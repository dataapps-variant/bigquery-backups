-- job_id: 3feae754-b7df-48fb-9a7b-19e7711e9346
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:10.606000+00:00
-- started: 2026-08-03T10:11:10.772000+00:00
-- ended: 2026-08-03T10:11:11.038000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickio_contractsdotnetllc`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
