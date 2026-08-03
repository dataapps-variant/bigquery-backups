-- job_id: b0f3e110-eada-49be-b0de-d7dec61f0740
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:29:32.273000+00:00
-- started: 2026-08-03T12:29:32.376000+00:00
-- ended: 2026-08-03T12:29:32.594000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.VPU_Merged`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
