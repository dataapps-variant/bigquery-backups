-- job_id: 724070a3-a175-408f-b2af-b8773cd82b58
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:50:14.292000+00:00
-- started: 2026-08-03T09:50:14.445000+00:00
-- ended: 2026-08-03T09:50:14.716000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.VPU_Merged`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
