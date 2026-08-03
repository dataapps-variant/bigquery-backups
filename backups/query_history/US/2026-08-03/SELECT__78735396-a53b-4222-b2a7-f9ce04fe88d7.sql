-- job_id: 78735396-a53b-4222-b2a7-f9ce04fe88d7
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:51:19.669000+00:00
-- started: 2026-08-03T11:51:19.756000+00:00
-- ended: 2026-08-03T11:51:19.922000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Extension_Refunds_Scenarios`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
