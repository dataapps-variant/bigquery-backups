-- job_id: 972ffe5a-d7fa-433c-a5f3-53b5f1c59074
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:02:58.254000+00:00
-- started: 2026-08-03T13:02:58.376000+00:00
-- ended: 2026-08-03T13:02:58.645000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Yahoo_Ads`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
