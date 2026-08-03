-- job_id: 1537a727-ed2a-4fd1-b0aa-aa6943a22c31
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:03:01.525000+00:00
-- started: 2026-08-03T13:03:01.676000+00:00
-- ended: 2026-08-03T13:03:02.506000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.airbyte_internal`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
