-- job_id: 8204f4f6-79df-4c95-b73d-75ebfb0fe595
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:02:14.003000+00:00
-- started: 2026-08-03T13:02:14.154000+00:00
-- ended: 2026-08-03T13:02:14.501000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Quora_ad_spend_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
