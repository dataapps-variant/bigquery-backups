-- job_id: 1c1fdf86-a994-4b59-9433-a8101d3cc951
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:08:57.129000+00:00
-- started: 2026-08-03T10:08:57.291000+00:00
-- ended: 2026-08-03T10:08:57.592000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Clicks_Data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
