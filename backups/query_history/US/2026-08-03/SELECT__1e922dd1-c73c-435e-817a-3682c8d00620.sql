-- job_id: 1e922dd1-c73c-435e-817a-3682c8d00620
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:08.461000+00:00
-- started: 2026-08-03T10:09:08.666000+00:00
-- ended: 2026-08-03T10:09:08.950000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Facbook_ad_spend_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
