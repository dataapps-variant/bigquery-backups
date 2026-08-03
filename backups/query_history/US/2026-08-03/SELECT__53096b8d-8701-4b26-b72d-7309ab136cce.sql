-- job_id: 53096b8d-8701-4b26-b72d-7309ab136cce
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:31.731000+00:00
-- started: 2026-08-03T10:10:31.836000+00:00
-- ended: 2026-08-03T10:10:32.104000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Yahoo_Ads`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
