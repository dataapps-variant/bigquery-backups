-- job_id: 603247ad-595f-434e-b512-3449dad1e7d8
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:38:13.334000+00:00
-- started: 2026-08-03T12:38:13.427000+00:00
-- ended: 2026-08-03T12:38:13.665000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.airbyte_internal`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
