-- job_id: 4b2139ce-719b-4b62-9d4f-cdb6e02f06ac
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:49:11.461000+00:00
-- started: 2026-08-03T09:49:11.626000+00:00
-- ended: 2026-08-03T09:49:11.852000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.ICARUS_Multi`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
