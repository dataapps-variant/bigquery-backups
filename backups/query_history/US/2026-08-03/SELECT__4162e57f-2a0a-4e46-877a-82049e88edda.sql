-- job_id: 4162e57f-2a0a-4e46-877a-82049e88edda
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:09:48.353000+00:00
-- started: 2026-08-03T09:09:48.468000+00:00
-- ended: 2026-08-03T09:09:48.647000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Cohort_Hunter`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
