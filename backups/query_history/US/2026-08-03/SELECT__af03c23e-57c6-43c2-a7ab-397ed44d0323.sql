-- job_id: af03c23e-57c6-43c2-a7ab-397ed44d0323
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:51:22.380000+00:00
-- started: 2026-08-03T09:51:22.509000+00:00
-- ended: 2026-08-03T09:51:22.692000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.vatiant_finance_Google_Query_Snapshots`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
