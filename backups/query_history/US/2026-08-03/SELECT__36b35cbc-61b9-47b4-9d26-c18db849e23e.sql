-- job_id: 36b35cbc-61b9-47b4-9d26-c18db849e23e
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:28:11.616000+00:00
-- started: 2026-08-03T12:28:11.703000+00:00
-- ended: 2026-08-03T12:28:12.041000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Cohort_Hunter`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
