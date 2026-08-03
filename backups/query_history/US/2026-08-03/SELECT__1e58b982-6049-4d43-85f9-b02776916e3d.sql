-- job_id: 1e58b982-6049-4d43-85f9-b02776916e3d
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:31:53.645000+00:00
-- started: 2026-08-03T09:31:53.769000+00:00
-- ended: 2026-08-03T09:31:54.304000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Icarus_Cohort`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
