-- job_id: 4cced465-ecd1-4a07-a30d-902142a53ff1
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:53:17.475000+00:00
-- started: 2026-08-03T11:53:17.551000+00:00
-- ended: 2026-08-03T11:53:17.782000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickio_contractsdotnetllc`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
