-- job_id: 1636576a-b0b1-4175-95e6-dc6277c9ac1c
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:30:06.514000+00:00
-- started: 2026-08-03T12:30:06.646000+00:00
-- ended: 2026-08-03T12:30:06.897000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.linkedin_ads_linkedin_ads_source`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
