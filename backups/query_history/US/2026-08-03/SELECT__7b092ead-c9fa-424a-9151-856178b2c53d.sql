-- job_id: 7b092ead-c9fa-424a-9151-856178b2c53d
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:51:36.058000+00:00
-- started: 2026-08-03T11:51:36.224000+00:00
-- ended: 2026-08-03T11:51:36.493000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Icarus_Cohort`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
