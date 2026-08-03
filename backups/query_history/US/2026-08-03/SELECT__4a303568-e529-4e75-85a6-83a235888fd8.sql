-- job_id: 4a303568-e529-4e75-85a6-83a235888fd8
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:37:03.399000+00:00
-- started: 2026-08-03T12:37:03.496000+00:00
-- ended: 2026-08-03T12:37:03.813000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.ICARUS_Multi`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
