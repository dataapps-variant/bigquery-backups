-- job_id: 3cbd9e27-3f52-48c3-8320-da6f3787aaad
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:28.373000+00:00
-- started: 2026-08-03T10:09:28.500000+00:00
-- ended: 2026-08-03T10:09:28.725000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Icarus_Spend_Country_AFID`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
