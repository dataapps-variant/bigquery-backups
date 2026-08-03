-- job_id: d37c38d4-9f87-43cb-960a-2bee488a8f42
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:30.033000+00:00
-- started: 2026-08-03T10:09:30.114000+00:00
-- ended: 2026-08-03T10:09:30.341000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Icarus_Spend_Country_AFID`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
