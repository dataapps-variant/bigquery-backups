-- job_id: 36a9ce02-8df3-4300-b4cc-f4f34ab43af9
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:52:55.521000+00:00
-- started: 2026-08-03T11:52:55.668000+00:00
-- ended: 2026-08-03T11:52:55.890000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.dim_table`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
