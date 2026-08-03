-- job_id: 8aa4b2ca-a721-4dc5-873e-22c7369df252
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:06.752000+00:00
-- started: 2026-08-03T10:09:06.808000+00:00
-- ended: 2026-08-03T10:09:06.969000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Extension_Scenario_Retention`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
