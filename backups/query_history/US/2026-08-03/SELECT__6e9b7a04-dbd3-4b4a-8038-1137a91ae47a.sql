-- job_id: 6e9b7a04-dbd3-4b4a-8038-1137a91ae47a
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:01:25.832000+00:00
-- started: 2026-08-03T13:01:25.980000+00:00
-- ended: 2026-08-03T13:01:26.329000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Daedalus`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
