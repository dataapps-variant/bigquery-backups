-- job_id: d1b6b705-02cb-43cc-a662-18bdbbbdebb6
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:52:25.518000+00:00
-- started: 2026-08-03T11:52:25.612000+00:00
-- ended: 2026-08-03T11:52:25.893000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Tiktok_ad_spend_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
