-- job_id: 8db4d40f-ccd2-4bb2-9d68-e7dc1b2507f7
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:01:38.078000+00:00
-- started: 2026-08-03T13:01:38.165000+00:00
-- ended: 2026-08-03T13:01:38.365000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Extension_Scenario_Retention`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
