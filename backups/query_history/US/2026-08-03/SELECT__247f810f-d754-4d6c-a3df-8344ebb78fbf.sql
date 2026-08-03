-- job_id: 247f810f-d754-4d6c-a3df-8344ebb78fbf
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:50:28.330000+00:00
-- started: 2026-08-03T09:50:28.457000+00:00
-- ended: 2026-08-03T09:50:28.701000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.csvdataset`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
