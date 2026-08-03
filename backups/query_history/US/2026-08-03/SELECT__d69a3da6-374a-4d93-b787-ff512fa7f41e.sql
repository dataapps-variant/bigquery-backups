-- job_id: d69a3da6-374a-4d93-b787-ff512fa7f41e
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:38:07.224000+00:00
-- started: 2026-08-03T12:38:07.341000+00:00
-- ended: 2026-08-03T12:38:07.570000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Verifications`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
