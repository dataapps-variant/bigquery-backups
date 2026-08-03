-- job_id: 749cb651-23b9-4d8d-a871-48a51e3dd724
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:38.953000+00:00
-- started: 2026-08-03T10:09:39.062000+00:00
-- ended: 2026-08-03T10:09:39.279000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.LMC`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
