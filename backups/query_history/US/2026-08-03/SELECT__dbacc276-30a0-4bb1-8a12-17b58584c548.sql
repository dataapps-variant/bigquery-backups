-- job_id: dbacc276-30a0-4bb1-8a12-17b58584c548
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:01:46.632000+00:00
-- started: 2026-08-03T13:01:46.766000+00:00
-- ended: 2026-08-03T13:01:47.080000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.ICARUS_Multi`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
