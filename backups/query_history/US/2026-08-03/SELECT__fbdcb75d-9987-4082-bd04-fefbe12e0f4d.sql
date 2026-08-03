-- job_id: fbdcb75d-9987-4082-bd04-fefbe12e0f4d
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:49:53.033000+00:00
-- started: 2026-08-03T09:49:53.158000+00:00
-- ended: 2026-08-03T09:49:53.823000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Sticky_Data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
