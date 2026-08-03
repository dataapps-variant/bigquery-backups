-- job_id: 73904d15-b22e-4950-96d2-351e17dc9e13
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:48:37.030000+00:00
-- started: 2026-08-03T09:48:37.193000+00:00
-- ended: 2026-08-03T09:48:37.424000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Ad_spend_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
