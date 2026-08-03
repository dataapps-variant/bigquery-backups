-- job_id: 8d06395c-0863-4f22-8e3b-b2a0e5911733
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:52:50.345000+00:00
-- started: 2026-08-03T11:52:50.441000+00:00
-- ended: 2026-08-03T11:52:50.648000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.csvdataset`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
