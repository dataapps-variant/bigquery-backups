-- job_id: b35c179e-121f-4421-b8fb-ad51e95f54dc
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:36:42.530000+00:00
-- started: 2026-08-03T12:36:42.625000+00:00
-- ended: 2026-08-03T12:36:42.859000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Cohort_Hunter`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
