-- job_id: 84620c2c-13fd-43f7-bc32-26a84722c649
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:04:01.695000+00:00
-- started: 2026-08-03T13:04:01.798000+00:00
-- ended: 2026-08-03T13:04:02.092000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.vatiant_finance_Google_Query_Snapshots`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
