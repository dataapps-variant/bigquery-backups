-- job_id: f47b012b-c777-43b8-8f1f-aeb387c28a38
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:37:32.567000+00:00
-- started: 2026-08-03T12:37:32.670000+00:00
-- ended: 2026-08-03T12:37:32.899000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.R100`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
