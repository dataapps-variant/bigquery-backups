-- job_id: 4ef93ff5-6caf-41cb-b272-20bb8602aefa
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:32.216000+00:00
-- started: 2026-08-03T10:09:32.325000+00:00
-- ended: 2026-08-03T10:09:32.819000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Icarus_Cohort`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
