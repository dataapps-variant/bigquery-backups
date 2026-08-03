-- job_id: 4d509038-31e9-4358-be3d-94013f24b382
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:52.653000+00:00
-- started: 2026-08-03T10:09:52.738000+00:00
-- ended: 2026-08-03T10:09:52.991000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Quora_ad_spend_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
