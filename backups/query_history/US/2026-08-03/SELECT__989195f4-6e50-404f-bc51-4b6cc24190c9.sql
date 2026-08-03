-- job_id: 989195f4-6e50-404f-bc51-4b6cc24190c9
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:52:48.744000+00:00
-- started: 2026-08-03T11:52:48.843000+00:00
-- ended: 2026-08-03T11:52:49.066000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.csvdataset`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
