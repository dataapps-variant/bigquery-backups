-- job_id: 511a4636-abc6-44dd-b55b-777d17b02b17
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:50:25.257000+00:00
-- started: 2026-08-03T09:50:25.360000+00:00
-- ended: 2026-08-03T09:50:25.569000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.airbyte_internal`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
