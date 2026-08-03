-- job_id: 03382629-c0de-49ed-9cf1-da3ce3f8e479
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:38.625000+00:00
-- started: 2026-08-03T10:09:38.725000+00:00
-- ended: 2026-08-03T10:09:38.953000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.MS_ad_spend_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
