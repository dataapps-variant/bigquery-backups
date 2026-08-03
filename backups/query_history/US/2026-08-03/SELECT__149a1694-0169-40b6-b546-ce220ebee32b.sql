-- job_id: 149a1694-0169-40b6-b546-ce220ebee32b
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:02:41.440000+00:00
-- started: 2026-08-03T13:02:41.563000+00:00
-- ended: 2026-08-03T13:02:41.811000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Tiktok_ad_spend_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
