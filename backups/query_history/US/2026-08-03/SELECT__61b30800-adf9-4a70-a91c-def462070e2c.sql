-- job_id: 61b30800-adf9-4a70-a91c-def462070e2c
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:02:55.041000+00:00
-- started: 2026-08-03T13:02:55.139000+00:00
-- ended: 2026-08-03T13:02:55.398000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Verifications`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
