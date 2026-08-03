-- job_id: 9685e96d-57be-4579-970c-48159d26a54d
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:36:44.169000+00:00
-- started: 2026-08-03T12:36:44.292000+00:00
-- ended: 2026-08-03T12:36:44.583000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Daedalus`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
