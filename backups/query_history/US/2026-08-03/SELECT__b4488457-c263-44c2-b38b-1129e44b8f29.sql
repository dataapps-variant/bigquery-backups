-- job_id: b4488457-c263-44c2-b38b-1129e44b8f29
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:03:29.326000+00:00
-- started: 2026-08-03T13:03:29.428000+00:00
-- ended: 2026-08-03T13:03:29.683000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.linkedin_ads_linkedin_ads_source`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
