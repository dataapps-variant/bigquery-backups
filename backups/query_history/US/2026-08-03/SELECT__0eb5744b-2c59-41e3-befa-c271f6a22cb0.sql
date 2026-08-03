-- job_id: 0eb5744b-2c59-41e3-befa-c271f6a22cb0
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:38:16.376000+00:00
-- started: 2026-08-03T12:38:16.484000+00:00
-- ended: 2026-08-03T12:38:16.690000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.csvdataset`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
