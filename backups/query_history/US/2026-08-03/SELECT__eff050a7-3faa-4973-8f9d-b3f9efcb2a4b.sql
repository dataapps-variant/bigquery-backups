-- job_id: eff050a7-3faa-4973-8f9d-b3f9efcb2a4b
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:18.439000+00:00
-- started: 2026-08-03T10:09:18.548000+00:00
-- ended: 2026-08-03T10:09:18.830000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Facbook_ad_spend_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
