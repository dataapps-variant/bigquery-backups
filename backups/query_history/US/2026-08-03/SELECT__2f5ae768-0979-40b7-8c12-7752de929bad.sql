-- job_id: 2f5ae768-0979-40b7-8c12-7752de929bad
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:49:04.787000+00:00
-- started: 2026-08-03T09:49:04.919000+00:00
-- ended: 2026-08-03T09:49:05.170000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Facbook_ad_spend_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
