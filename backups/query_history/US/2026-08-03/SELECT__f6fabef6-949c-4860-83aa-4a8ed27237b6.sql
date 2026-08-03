-- job_id: f6fabef6-949c-4860-83aa-4a8ed27237b6
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:28:41.858000+00:00
-- started: 2026-08-03T12:28:41.978000+00:00
-- ended: 2026-08-03T12:28:42.219000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Icarus_Spend_Country_AFID`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
