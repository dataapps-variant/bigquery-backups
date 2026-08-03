-- job_id: 0274dffe-448f-49ce-96af-dee081bc2d23
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:02:53.331000+00:00
-- started: 2026-08-03T13:02:53.437000+00:00
-- ended: 2026-08-03T13:02:53.644000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.VPU_Merged`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
