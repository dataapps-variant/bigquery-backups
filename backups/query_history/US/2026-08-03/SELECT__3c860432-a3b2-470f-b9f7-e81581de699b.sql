-- job_id: 3c860432-a3b2-470f-b9f7-e81581de699b
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:25.572000+00:00
-- started: 2026-08-03T10:09:25.659000+00:00
-- ended: 2026-08-03T10:09:25.936000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.ICARUS_Multi`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
