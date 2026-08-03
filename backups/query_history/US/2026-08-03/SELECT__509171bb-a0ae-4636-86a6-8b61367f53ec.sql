-- job_id: 509171bb-a0ae-4636-86a6-8b61367f53ec
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:06.348000+00:00
-- started: 2026-08-03T10:10:06.570000+00:00
-- ended: 2026-08-03T10:10:06.826000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Spend_Data_Snapshot`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
