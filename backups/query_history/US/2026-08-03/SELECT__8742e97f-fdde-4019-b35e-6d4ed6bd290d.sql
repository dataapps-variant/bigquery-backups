-- job_id: 8742e97f-fdde-4019-b35e-6d4ed6bd290d
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:14.549000+00:00
-- started: 2026-08-03T10:09:14.672000+00:00
-- ended: 2026-08-03T10:09:14.926000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Extension_Scenario_Retention`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
