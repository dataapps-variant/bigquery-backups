-- job_id: e91a7a8f-70af-40b4-afbe-e431a661fc62
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:55.056000+00:00
-- started: 2026-08-03T10:10:55.152000+00:00
-- ended: 2026-08-03T10:10:55.372000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.linkedin_ads`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
