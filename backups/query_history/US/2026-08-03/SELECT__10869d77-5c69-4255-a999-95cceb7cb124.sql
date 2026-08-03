-- job_id: 10869d77-5c69-4255-a999-95cceb7cb124
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:45.719000+00:00
-- started: 2026-08-03T10:09:45.829000+00:00
-- ended: 2026-08-03T10:09:46.075000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Quora_ad_spend_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
