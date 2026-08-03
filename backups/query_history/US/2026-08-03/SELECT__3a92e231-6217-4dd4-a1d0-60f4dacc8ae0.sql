-- job_id: 3a92e231-6217-4dd4-a1d0-60f4dacc8ae0
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:08:35.602000+00:00
-- started: 2026-08-03T10:08:35.743000+00:00
-- ended: 2026-08-03T10:08:36.009000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Ad_spend_data`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
