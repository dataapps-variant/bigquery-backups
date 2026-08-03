-- job_id: ed5c8871-b46e-41b3-b6a4-5860ff4f9944
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:52:31.925000+00:00
-- started: 2026-08-03T11:52:32.032000+00:00
-- ended: 2026-08-03T11:52:32.277000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.VPU`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
