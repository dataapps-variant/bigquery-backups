-- job_id: 7ad66651-204e-4815-9569-dce67188c598
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:51:01.419000+00:00
-- started: 2026-08-03T11:51:01.576000+00:00
-- ended: 2026-08-03T11:51:01.832000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.CWC`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
