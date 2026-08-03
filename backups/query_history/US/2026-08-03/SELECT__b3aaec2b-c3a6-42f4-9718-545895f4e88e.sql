-- job_id: b3aaec2b-c3a6-42f4-9718-545895f4e88e
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:17.308000+00:00
-- started: 2026-08-03T10:10:17.465000+00:00
-- ended: 2026-08-03T10:10:17.672000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Utilities`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
