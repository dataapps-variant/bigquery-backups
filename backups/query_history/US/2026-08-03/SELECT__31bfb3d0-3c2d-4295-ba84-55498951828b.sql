-- job_id: 31bfb3d0-3c2d-4295-ba84-55498951828b
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:11.396000+00:00
-- started: 2026-08-03T10:09:11.528000+00:00
-- ended: 2026-08-03T10:09:11.739000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Extension_Refunds_Scenarios`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
