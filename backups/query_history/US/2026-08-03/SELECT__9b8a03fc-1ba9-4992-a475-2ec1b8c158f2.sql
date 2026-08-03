-- job_id: 9b8a03fc-1ba9-4992-a475-2ec1b8c158f2
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:28:25.657000+00:00
-- started: 2026-08-03T12:28:25.719000+00:00
-- ended: 2026-08-03T12:28:25.949000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Extension_Scenario_Retention`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
