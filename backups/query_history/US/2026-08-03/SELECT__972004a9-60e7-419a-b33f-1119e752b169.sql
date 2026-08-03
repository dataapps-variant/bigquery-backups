-- job_id: 972004a9-60e7-419a-b33f-1119e752b169
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:49:03.004000+00:00
-- started: 2026-08-03T09:49:03.214000+00:00
-- ended: 2026-08-03T09:49:03.522000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Extension_Scenario_Retention`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
