-- job_id: c7e1110c-bbee-487f-8018-b0976bbac1ea
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:50:10.295000+00:00
-- started: 2026-08-03T09:50:10.420000+00:00
-- ended: 2026-08-03T09:50:10.647000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.VPU`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
