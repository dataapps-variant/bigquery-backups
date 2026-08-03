-- job_id: 03b9d8b9-a3fd-4e61-9d49-eb9f63ad81e4
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:50:00.362000+00:00
-- started: 2026-08-03T09:50:00.508000+00:00
-- ended: 2026-08-03T09:50:00.742000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Sticky_Reports`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
