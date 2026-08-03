-- job_id: 17db53c1-212e-4362-90b4-1e89673ed7ff
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:52:14.588000+00:00
-- started: 2026-08-03T11:52:14.749000+00:00
-- ended: 2026-08-03T11:52:15.399000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Sticky_Data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
