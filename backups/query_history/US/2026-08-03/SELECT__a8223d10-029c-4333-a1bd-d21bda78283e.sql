-- job_id: a8223d10-029c-4333-a1bd-d21bda78283e
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:03:41.962000+00:00
-- started: 2026-08-03T13:03:42.053000+00:00
-- ended: 2026-08-03T13:03:42.291000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.stickio_jobflowllc`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
