-- job_id: 4b7ae04b-bf95-4f34-b601-ef505cce2f04
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:37.925000+00:00
-- started: 2026-08-03T10:11:38.013000+00:00
-- ended: 2026-08-03T10:11:38.254000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.vatiant_finance_Google_Query_Snapshots`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
