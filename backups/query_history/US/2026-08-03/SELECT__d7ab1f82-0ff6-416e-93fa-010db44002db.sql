-- job_id: d7ab1f82-0ff6-416e-93fa-010db44002db
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:37:38.580000+00:00
-- started: 2026-08-03T12:37:38.676000+00:00
-- ended: 2026-08-03T12:37:38.899000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Shared_PD_Data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
