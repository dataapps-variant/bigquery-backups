-- job_id: 77d33581-6464-4bba-a7da-b96bd636e7fe
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:16.968000+00:00
-- started: 2026-08-03T10:09:17.024000+00:00
-- ended: 2026-08-03T10:09:17.205000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Extension_Scenario_Retention`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
