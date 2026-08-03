-- job_id: f729b942-711a-4be0-a638-e4ac36709dd8
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:30:38.295000+00:00
-- started: 2026-08-03T12:30:38.388000+00:00
-- ended: 2026-08-03T12:30:38.644000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.vatiant_finance_Google_Query_Snapshots`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
