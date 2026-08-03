-- job_id: b23b920d-5d56-4b4d-96c8-af7ac733747f
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:50:31.349000+00:00
-- started: 2026-08-03T09:50:31.478000+00:00
-- ended: 2026-08-03T09:50:31.743000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.demo_practise`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
