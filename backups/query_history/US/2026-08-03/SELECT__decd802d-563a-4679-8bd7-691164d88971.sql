-- job_id: decd802d-563a-4679-8bd7-691164d88971
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:34.977000+00:00
-- started: 2026-08-03T10:10:35.080000+00:00
-- ended: 2026-08-03T10:10:35.325000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.airbyte_internal`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
