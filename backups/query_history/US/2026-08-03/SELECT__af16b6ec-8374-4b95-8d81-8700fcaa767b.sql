-- job_id: af16b6ec-8374-4b95-8d81-8700fcaa767b
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:40.715000+00:00
-- started: 2026-08-03T10:10:40.793000+00:00
-- ended: 2026-08-03T10:10:41.039000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.airbyte_internal`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
