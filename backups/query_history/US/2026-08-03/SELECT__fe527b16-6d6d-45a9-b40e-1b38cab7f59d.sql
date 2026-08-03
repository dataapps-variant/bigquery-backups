-- job_id: fe527b16-6d6d-45a9-b40e-1b38cab7f59d
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:28:33.070000+00:00
-- started: 2026-08-03T12:28:33.178000+00:00
-- ended: 2026-08-03T12:28:33.408000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.ICARUS_Multi`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
