-- job_id: 5cc55499-df1b-4255-bb4d-a00bc5037231
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:52.479000+00:00
-- started: 2026-08-03T10:09:52.559000+00:00
-- ended: 2026-08-03T10:09:52.831000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Shared_JF_Data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
