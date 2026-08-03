-- job_id: 4c368b02-d0e2-4e0c-beca-f13543453759
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:36:55.521000+00:00
-- started: 2026-08-03T12:36:55.618000+00:00
-- ended: 2026-08-03T12:36:55.763000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Extension_Scenario_Retention`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
