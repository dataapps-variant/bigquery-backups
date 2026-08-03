-- job_id: 7935b50e-84d1-4c13-ae29-bc5af7707499
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:02:35.007000+00:00
-- started: 2026-08-03T13:02:35.119000+00:00
-- ended: 2026-08-03T13:02:35.421000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Sticky_Data_Snapshots`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
