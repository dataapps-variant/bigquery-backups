-- job_id: 51d35823-f1ed-45e7-84b6-b2804f813aa6
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:01:14.198000+00:00
-- started: 2026-08-03T13:01:14.367000+00:00
-- ended: 2026-08-03T13:01:14.652000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.CWC`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
