-- job_id: e9fb7107-59a8-401f-9f07-4a46aa17c71d
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:03:07.250000+00:00
-- started: 2026-08-03T13:03:07.442000+00:00
-- ended: 2026-08-03T13:03:07.648000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.csvdataset`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
