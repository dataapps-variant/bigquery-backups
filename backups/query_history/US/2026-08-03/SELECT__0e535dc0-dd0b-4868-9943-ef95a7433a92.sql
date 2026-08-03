-- job_id: 0e535dc0-dd0b-4868-9943-ef95a7433a92
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:36.507000+00:00
-- started: 2026-08-03T10:11:36.628000+00:00
-- ended: 2026-08-03T10:11:37.010000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.vatiant_finance_Google_Query_Snapshots`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
