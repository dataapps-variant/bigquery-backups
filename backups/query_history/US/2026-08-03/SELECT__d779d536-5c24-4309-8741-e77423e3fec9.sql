-- job_id: d779d536-5c24-4309-8741-e77423e3fec9
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:51:11.389000+00:00
-- started: 2026-08-03T11:51:11.514000+00:00
-- ended: 2026-08-03T11:51:11.766000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Daedalus`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
