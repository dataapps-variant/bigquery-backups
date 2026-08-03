-- job_id: fe023465-1dca-4225-9514-672bec1c533e
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:51:47.664000+00:00
-- started: 2026-08-03T11:51:47.810000+00:00
-- ended: 2026-08-03T11:51:48.062000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Linkedin_ad_spend_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
