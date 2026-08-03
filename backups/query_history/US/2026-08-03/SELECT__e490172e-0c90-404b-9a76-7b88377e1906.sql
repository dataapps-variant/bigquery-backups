-- job_id: e490172e-0c90-404b-9a76-7b88377e1906
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:52:45.477000+00:00
-- started: 2026-08-03T11:52:45.572000+00:00
-- ended: 2026-08-03T11:52:45.803000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.airbyte_internal`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
