-- job_id: cd3de211-da25-4ca4-a92d-7d592f17af15
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:51:31.410000+00:00
-- started: 2026-08-03T11:51:31.534000+00:00
-- ended: 2026-08-03T11:51:31.823000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.ICARUS_Multi`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
