-- job_id: 58b506bf-7b8e-45ee-9542-9ad9a3c11634
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:31:58.971000+00:00
-- started: 2026-08-03T09:31:59.092000+00:00
-- ended: 2026-08-03T09:31:59.262000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.LMC`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
