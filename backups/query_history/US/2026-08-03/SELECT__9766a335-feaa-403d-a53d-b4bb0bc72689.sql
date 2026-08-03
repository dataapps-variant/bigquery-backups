-- job_id: 9766a335-feaa-403d-a53d-b4bb0bc72689
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:52:05.956000+00:00
-- started: 2026-08-03T11:52:06.037000+00:00
-- ended: 2026-08-03T11:52:06.239000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Shared_JF_Data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
