-- job_id: a41404a7-d995-4d8b-913d-6b3f64bd693f
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:36:50.727000+00:00
-- started: 2026-08-03T12:36:50.838000+00:00
-- ended: 2026-08-03T12:36:51.046000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Extension_Refunds_Scenarios`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
