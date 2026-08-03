-- job_id: 63fa1efd-74e2-47bc-b9eb-be5924a747ec
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:38:23.901000+00:00
-- started: 2026-08-03T12:38:23.989000+00:00
-- ended: 2026-08-03T12:38:24.200000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.dim_table`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
