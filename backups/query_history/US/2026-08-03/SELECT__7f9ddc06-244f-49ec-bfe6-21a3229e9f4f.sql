-- job_id: 7f9ddc06-244f-49ec-bfe6-21a3229e9f4f
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:31.367000+00:00
-- started: 2026-08-03T10:10:31.479000+00:00
-- ended: 2026-08-03T10:10:31.727000+00:00


            SELECT table_name, table_type, ddl
            FROM `variant-finance-data-project.VPU_Merged`.INFORMATION_SCHEMA.TABLES
            WHERE table_type IN ('VIEW', 'MATERIALIZED_VIEW')
            ORDER BY table_name
