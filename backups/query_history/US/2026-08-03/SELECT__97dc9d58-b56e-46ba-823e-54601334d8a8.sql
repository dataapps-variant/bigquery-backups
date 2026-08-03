-- job_id: 97dc9d58-b56e-46ba-823e-54601334d8a8
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:29:29.088000+00:00
-- started: 2026-08-03T12:29:29.232000+00:00
-- ended: 2026-08-03T12:29:29.492000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.VPU`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
