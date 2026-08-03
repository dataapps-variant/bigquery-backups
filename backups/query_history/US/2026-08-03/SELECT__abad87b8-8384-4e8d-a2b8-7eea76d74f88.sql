-- job_id: abad87b8-8384-4e8d-a2b8-7eea76d74f88
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:51:37.696000+00:00
-- started: 2026-08-03T11:51:37.776000+00:00
-- ended: 2026-08-03T11:51:38.310000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Icarus_Cohort`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
