-- job_id: dad8b8c6-781b-4333-bc97-202adbd09834
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:49:17.937000+00:00
-- started: 2026-08-03T09:49:18.011000+00:00
-- ended: 2026-08-03T09:49:18.498000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Icarus_Cohort`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
