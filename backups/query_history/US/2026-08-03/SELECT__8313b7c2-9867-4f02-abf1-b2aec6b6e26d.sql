-- job_id: 8313b7c2-9867-4f02-abf1-b2aec6b6e26d
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:02:51.651000+00:00
-- started: 2026-08-03T13:02:51.788000+00:00
-- ended: 2026-08-03T13:02:52.045000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.VPU_Merged`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
