-- job_id: 7c6d6bb7-bf10-4f9a-a42c-74e769cfb6b2
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:37:08.100000+00:00
-- started: 2026-08-03T12:37:08.229000+00:00
-- ended: 2026-08-03T12:37:08.618000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Icarus_Cohort`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
