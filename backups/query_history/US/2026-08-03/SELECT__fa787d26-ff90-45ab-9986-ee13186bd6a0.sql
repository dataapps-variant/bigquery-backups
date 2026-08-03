-- job_id: fa787d26-ff90-45ab-9986-ee13186bd6a0
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:01:39.674000+00:00
-- started: 2026-08-03T13:01:39.819000+00:00
-- ended: 2026-08-03T13:01:40.159000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Facbook_ad_spend_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
