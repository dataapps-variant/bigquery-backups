-- job_id: b10883f0-9915-4f16-ac08-ba33e62ccbf9
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:49:37.579000+00:00
-- started: 2026-08-03T09:49:37.695000+00:00
-- ended: 2026-08-03T09:49:37.948000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Quora_ad_spend_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
