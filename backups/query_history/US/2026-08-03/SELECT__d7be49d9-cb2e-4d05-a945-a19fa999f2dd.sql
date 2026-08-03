-- job_id: d7be49d9-cb2e-4d05-a945-a19fa999f2dd
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:36:57.015000+00:00
-- started: 2026-08-03T12:36:57.130000+00:00
-- ended: 2026-08-03T12:36:57.363000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Facbook_ad_spend_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
