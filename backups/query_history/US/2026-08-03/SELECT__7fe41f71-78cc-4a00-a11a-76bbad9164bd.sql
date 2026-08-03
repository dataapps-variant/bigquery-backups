-- job_id: 7fe41f71-78cc-4a00-a11a-76bbad9164bd
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:37.742000+00:00
-- started: 2026-08-03T10:10:37.850000+00:00
-- ended: 2026-08-03T10:10:38.054000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Yahoo_Ads`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
