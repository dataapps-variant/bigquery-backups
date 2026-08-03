-- job_id: 605471d7-a1ca-4b9f-bd04-220edfad2e95
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:05:02.938000+00:00
-- started: 2026-08-03T09:05:03.102000+00:00
-- ended: 2026-08-03T09:05:03.316000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Icarus_Spend_Country_AFID`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
