-- job_id: 85b972e8-42aa-4c62-b5c4-48ed4aebf2ce
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:31.832000+00:00
-- started: 2026-08-03T10:09:31.973000+00:00
-- ended: 2026-08-03T10:09:32.178000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.LMC`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
