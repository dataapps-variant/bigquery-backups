-- job_id: 1182960a-f608-4070-93a6-f0d0ca03ed0a
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:08:55.363000+00:00
-- started: 2026-08-03T10:08:55.504000+00:00
-- ended: 2026-08-03T10:08:55.718000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Decline_Reason`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
