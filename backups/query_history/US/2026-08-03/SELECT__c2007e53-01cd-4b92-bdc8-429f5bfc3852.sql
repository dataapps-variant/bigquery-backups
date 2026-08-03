-- job_id: c2007e53-01cd-4b92-bdc8-429f5bfc3852
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:03:48.479000+00:00
-- started: 2026-08-03T13:03:48.595000+00:00
-- ended: 2026-08-03T13:03:49.154000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickio_pdfdotnet`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
