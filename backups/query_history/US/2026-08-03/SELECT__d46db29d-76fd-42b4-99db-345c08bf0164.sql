-- job_id: d46db29d-76fd-42b4-99db-345c08bf0164
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:28:57.209000+00:00
-- started: 2026-08-03T12:28:57.308000+00:00
-- ended: 2026-08-03T12:28:57.557000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Quora_ad_spend_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
