-- job_id: cf8f3e6c-51bc-4173-b4d1-2c3b145418a2
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:39:11.014000+00:00
-- started: 2026-08-03T12:39:11.226000+00:00
-- ended: 2026-08-03T12:39:11.668000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
