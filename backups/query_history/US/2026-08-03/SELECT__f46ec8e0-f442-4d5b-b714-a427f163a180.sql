-- job_id: f46ec8e0-f442-4d5b-b714-a427f163a180
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:08:59.363000+00:00
-- started: 2026-08-03T10:08:59.489000+00:00
-- ended: 2026-08-03T10:08:59.721000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Extension_Refunds_Scenarios`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
