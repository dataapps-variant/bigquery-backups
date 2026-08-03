-- job_id: 3483bf51-f1ab-4281-b376-008c433c9013
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:02:47.802000+00:00
-- started: 2026-08-03T13:02:47.991000+00:00
-- ended: 2026-08-03T13:02:48.532000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.VPU`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
