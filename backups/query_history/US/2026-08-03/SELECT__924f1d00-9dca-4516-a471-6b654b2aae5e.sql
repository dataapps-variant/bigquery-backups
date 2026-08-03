-- job_id: 924f1d00-9dca-4516-a471-6b654b2aae5e
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:42.882000+00:00
-- started: 2026-08-03T10:11:42.965000+00:00
-- ended: 2026-08-03T10:11:43.221000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
