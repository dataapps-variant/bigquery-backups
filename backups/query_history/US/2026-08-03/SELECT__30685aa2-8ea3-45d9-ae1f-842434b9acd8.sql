-- job_id: 30685aa2-8ea3-45d9-ae1f-842434b9acd8
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:12:29.680000+00:00
-- started: 2026-08-03T09:12:29.783000+00:00
-- ended: 2026-08-03T09:12:29.959000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Extension_Scenario_Retention`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
