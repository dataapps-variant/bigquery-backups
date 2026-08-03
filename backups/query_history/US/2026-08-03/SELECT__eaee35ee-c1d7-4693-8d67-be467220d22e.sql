-- job_id: eaee35ee-c1d7-4693-8d67-be467220d22e
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:50:21.408000+00:00
-- started: 2026-08-03T09:50:21.503000+00:00
-- ended: 2026-08-03T09:50:21.739000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Yahoo_Ads`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
