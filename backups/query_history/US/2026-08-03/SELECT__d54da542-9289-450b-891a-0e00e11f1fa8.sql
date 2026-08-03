-- job_id: d54da542-9289-450b-891a-0e00e11f1fa8
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:48:54.843000+00:00
-- started: 2026-08-03T09:48:55.026000+00:00
-- ended: 2026-08-03T09:48:55.251000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.Decline_Reason`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
