-- job_id: 17d17838-1876-42fd-94c5-f60535e6ccb2
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:29:00.231000+00:00
-- started: 2026-08-03T12:29:00.344000+00:00
-- ended: 2026-08-03T12:29:00.605000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.R100`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
