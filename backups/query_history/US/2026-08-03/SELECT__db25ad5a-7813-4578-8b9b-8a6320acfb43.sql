-- job_id: db25ad5a-7813-4578-8b9b-8a6320acfb43
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:28.115000+00:00
-- started: 2026-08-03T10:10:28.187000+00:00
-- ended: 2026-08-03T10:10:28.449000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.VPU`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
