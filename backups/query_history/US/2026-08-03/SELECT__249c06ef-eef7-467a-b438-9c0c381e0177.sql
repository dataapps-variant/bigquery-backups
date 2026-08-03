-- job_id: 249c06ef-eef7-467a-b438-9c0c381e0177
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:50:59.331000+00:00
-- started: 2026-08-03T09:50:59.495000+00:00
-- ended: 2026-08-03T09:50:59.737000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickio_formsourcellc`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
