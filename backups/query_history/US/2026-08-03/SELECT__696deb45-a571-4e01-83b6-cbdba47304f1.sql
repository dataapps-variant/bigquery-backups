-- job_id: 696deb45-a571-4e01-83b6-cbdba47304f1
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:38:10.282000+00:00
-- started: 2026-08-03T12:38:10.376000+00:00
-- ended: 2026-08-03T12:38:10.656000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Yahoo_Ads`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
