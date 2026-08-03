-- job_id: 339b2aeb-4838-4d4b-afcf-52ed3387b678
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:32:34.465000+00:00
-- started: 2026-08-03T09:32:34.570000+00:00
-- ended: 2026-08-03T09:32:34.743000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.dim_table`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
