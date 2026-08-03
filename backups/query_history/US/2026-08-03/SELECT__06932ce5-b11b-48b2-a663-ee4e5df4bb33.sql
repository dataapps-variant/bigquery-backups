-- job_id: 06932ce5-b11b-48b2-a663-ee4e5df4bb33
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:10:04.578000+00:00
-- started: 2026-08-03T10:10:04.775000+00:00
-- ended: 2026-08-03T10:10:04.974000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Shared_PD_Data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
