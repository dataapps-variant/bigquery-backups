-- job_id: 51fb07a8-0998-4999-bee5-00e062532688
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:28:45.009000+00:00
-- started: 2026-08-03T12:28:45.113000+00:00
-- ended: 2026-08-03T12:28:45.356000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.LMC`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
