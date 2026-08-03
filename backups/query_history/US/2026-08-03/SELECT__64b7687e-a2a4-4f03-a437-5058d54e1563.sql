-- job_id: 64b7687e-a2a4-4f03-a437-5058d54e1563
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:49:57.394000+00:00
-- started: 2026-08-03T09:49:57.517000+00:00
-- ended: 2026-08-03T09:49:57.745000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Sticky_Data_Snapshots`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
