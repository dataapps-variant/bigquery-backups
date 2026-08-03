-- job_id: aec941b4-11cd-491e-9e55-ac6a462ba8d9
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:41.314000+00:00
-- started: 2026-08-03T10:11:41.393000+00:00
-- ended: 2026-08-03T10:11:41.651000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
