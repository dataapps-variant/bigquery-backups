-- job_id: f31460e3-3002-4169-90cd-b0fbc86bf6d5
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:08:39.322000+00:00
-- started: 2026-08-03T10:08:39.465000+00:00
-- ended: 2026-08-03T10:08:40.075000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.CWC`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
