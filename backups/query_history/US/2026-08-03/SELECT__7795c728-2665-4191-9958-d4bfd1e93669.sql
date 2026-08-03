-- job_id: 7795c728-2665-4191-9958-d4bfd1e93669
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:31:43.895000+00:00
-- started: 2026-08-03T09:31:44.071000+00:00
-- ended: 2026-08-03T09:31:44.275000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Extension_Scenario_Retention`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
