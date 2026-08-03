-- job_id: a65d7836-b4e4-4357-875d-94663666e935
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:29:42.246000+00:00
-- started: 2026-08-03T12:29:42.364000+00:00
-- ended: 2026-08-03T12:29:42.594000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.airbyte_internal`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
