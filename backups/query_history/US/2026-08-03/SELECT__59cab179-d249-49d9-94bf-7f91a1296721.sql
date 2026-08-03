-- job_id: 59cab179-d249-49d9-94bf-7f91a1296721
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:51:18.020000+00:00
-- started: 2026-08-03T11:51:18.135000+00:00
-- ended: 2026-08-03T11:51:18.403000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Extension_Refunds_Scenarios`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
