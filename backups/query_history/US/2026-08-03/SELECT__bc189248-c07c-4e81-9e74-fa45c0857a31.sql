-- job_id: bc189248-c07c-4e81-9e74-fa45c0857a31
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:29:06.642000+00:00
-- started: 2026-08-03T12:29:06.751000+00:00
-- ended: 2026-08-03T12:29:07.011000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Shared_PD_Data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
