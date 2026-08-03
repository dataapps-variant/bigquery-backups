-- job_id: 88f03d67-108a-422b-992d-99d2416701f3
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:51:57.425000+00:00
-- started: 2026-08-03T11:51:57.553000+00:00
-- ended: 2026-08-03T11:51:57.804000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Quora_ad_spend_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
