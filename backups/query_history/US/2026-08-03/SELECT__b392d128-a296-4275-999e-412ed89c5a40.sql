-- job_id: b392d128-a296-4275-999e-412ed89c5a40
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:15.962000+00:00
-- started: 2026-08-03T10:10:16.064000+00:00
-- ended: 2026-08-03T10:10:16.273000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Sticky_Data_Snapshots`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
