-- job_id: b098a8e7-3342-422e-ba16-50e717887e7c
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:52:38.915000+00:00
-- started: 2026-08-03T11:52:39.033000+00:00
-- ended: 2026-08-03T11:52:39.244000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Verifications`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
