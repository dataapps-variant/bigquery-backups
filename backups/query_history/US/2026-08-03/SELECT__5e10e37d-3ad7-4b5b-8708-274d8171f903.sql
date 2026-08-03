-- job_id: 5e10e37d-3ad7-4b5b-8708-274d8171f903
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:02.329000+00:00
-- started: 2026-08-03T10:09:02.439000+00:00
-- ended: 2026-08-03T10:09:02.652000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Cohort_Hunter`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
