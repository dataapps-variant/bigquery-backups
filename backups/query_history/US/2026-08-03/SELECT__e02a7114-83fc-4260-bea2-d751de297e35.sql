-- job_id: e02a7114-83fc-4260-bea2-d751de297e35
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:11:02.312000+00:00
-- started: 2026-08-03T10:11:02.409000+00:00
-- ended: 2026-08-03T10:11:02.657000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.linkedin_ads_linkedin_ads_source`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
