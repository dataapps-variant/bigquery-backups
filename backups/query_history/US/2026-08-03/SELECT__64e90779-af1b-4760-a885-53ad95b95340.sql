-- job_id: 64e90779-af1b-4760-a885-53ad95b95340
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:38:03.790000+00:00
-- started: 2026-08-03T12:38:03.901000+00:00
-- ended: 2026-08-03T12:38:04.180000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.VPU_Merged`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
