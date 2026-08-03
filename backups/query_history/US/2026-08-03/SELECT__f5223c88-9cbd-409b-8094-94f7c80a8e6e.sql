-- job_id: f5223c88-9cbd-409b-8094-94f7c80a8e6e
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:49:46.757000+00:00
-- started: 2026-08-03T09:49:46.877000+00:00
-- ended: 2026-08-03T09:49:47.131000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Shared_PD_Data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
