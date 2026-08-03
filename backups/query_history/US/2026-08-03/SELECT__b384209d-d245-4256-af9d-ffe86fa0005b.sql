-- job_id: b384209d-d245-4256-af9d-ffe86fa0005b
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:35.173000+00:00
-- started: 2026-08-03T10:09:35.297000+00:00
-- ended: 2026-08-03T10:09:35.605000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Linkedin_ad_spend_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
