-- job_id: 790c7bbf-96b3-4809-93ee-6ccaf8c842f4
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:55.886000+00:00
-- started: 2026-08-03T10:09:55.966000+00:00
-- ended: 2026-08-03T10:09:56.198000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Shared_PD_Data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
