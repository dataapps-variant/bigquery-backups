-- job_id: 5d230176-7844-4f1f-a750-58a5d1e0bf3b
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:55.722000+00:00
-- started: 2026-08-03T10:09:55.819000+00:00
-- ended: 2026-08-03T10:09:56.109000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.R100`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
