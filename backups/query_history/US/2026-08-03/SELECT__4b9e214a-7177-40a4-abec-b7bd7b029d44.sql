-- job_id: 4b9e214a-7177-40a4-abec-b7bd7b029d44
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:50:36.298000+00:00
-- started: 2026-08-03T09:50:36.393000+00:00
-- ended: 2026-08-03T09:50:36.543000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.dim_table`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
