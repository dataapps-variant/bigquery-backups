-- job_id: 43fb4b99-dee0-47cb-86e0-5dd906079198
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:51:22.991000+00:00
-- started: 2026-08-03T11:51:23.093000+00:00
-- ended: 2026-08-03T11:51:23.271000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Extension_Scenario_Retention`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
