-- job_id: 28a92038-3e73-4c56-9fd4-834ca9339b27
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:03:38.742000+00:00
-- started: 2026-08-03T13:03:38.863000+00:00
-- ended: 2026-08-03T13:03:39.134000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickio_formsourcellc`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
