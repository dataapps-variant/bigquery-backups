-- job_id: cd7e5644-03c8-4ac6-819a-bf48f2ed0e5d
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:29:03.748000+00:00
-- started: 2026-08-03T12:29:03.835000+00:00
-- ended: 2026-08-03T12:29:04.049000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Shared_JF_Data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
