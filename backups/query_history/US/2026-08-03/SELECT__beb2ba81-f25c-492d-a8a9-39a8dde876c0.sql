-- job_id: beb2ba81-f25c-492d-a8a9-39a8dde876c0
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:09.422000+00:00
-- started: 2026-08-03T10:10:09.530000+00:00
-- ended: 2026-08-03T10:10:10.162000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Sticky_Data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
