-- job_id: c58f6c30-4ba3-44e7-9d3f-9fa59d3d2f59
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:52:04.004000+00:00
-- started: 2026-08-03T11:52:04.245000+00:00
-- ended: 2026-08-03T11:52:04.665000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Shared_JF_Data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
