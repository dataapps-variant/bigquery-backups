-- job_id: f418667d-c166-45f3-bdf9-aa162d6a0378
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:08:53.318000+00:00
-- started: 2026-08-03T10:08:53.450000+00:00
-- ended: 2026-08-03T10:08:53.690000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.CWC`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
