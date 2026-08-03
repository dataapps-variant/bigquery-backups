-- job_id: 18463014-8f38-4557-a73e-c459082f2a9c
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:32:11.657000+00:00
-- started: 2026-08-03T09:32:11.762000+00:00
-- ended: 2026-08-03T09:32:11.913000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Shared_PD_Data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
