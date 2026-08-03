-- job_id: 3206c785-ec21-40ce-ac34-ff95d74b81b9
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:03:05.479000+00:00
-- started: 2026-08-03T13:03:05.624000+00:00
-- ended: 2026-08-03T13:03:05.982000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.csvdataset`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
