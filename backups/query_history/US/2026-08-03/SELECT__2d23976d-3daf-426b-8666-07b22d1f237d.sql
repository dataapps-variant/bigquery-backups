-- job_id: 2d23976d-3daf-426b-8666-07b22d1f237d
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:42.118000+00:00
-- started: 2026-08-03T10:09:42.245000+00:00
-- ended: 2026-08-03T10:09:42.478000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Linkedin_ad_spend_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
