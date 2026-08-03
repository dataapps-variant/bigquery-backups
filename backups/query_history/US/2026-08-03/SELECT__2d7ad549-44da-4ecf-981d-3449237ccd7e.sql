-- job_id: 2d7ad549-44da-4ecf-981d-3449237ccd7e
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:24.550000+00:00
-- started: 2026-08-03T10:10:24.713000+00:00
-- ended: 2026-08-03T10:10:24.962000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.VPU_Merged`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
