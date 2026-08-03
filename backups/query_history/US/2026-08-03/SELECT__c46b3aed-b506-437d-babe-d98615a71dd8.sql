-- job_id: c46b3aed-b506-437d-babe-d98615a71dd8
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:52:35.040000+00:00
-- started: 2026-08-03T11:52:35.168000+00:00
-- ended: 2026-08-03T11:52:35.411000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.VPU_Merged`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
