-- job_id: c01bb787-42fc-4857-ba06-77fb6de4c79e
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:37:19.560000+00:00
-- started: 2026-08-03T12:37:19.680000+00:00
-- ended: 2026-08-03T12:37:19.923000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Linkedin_ad_spend_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
