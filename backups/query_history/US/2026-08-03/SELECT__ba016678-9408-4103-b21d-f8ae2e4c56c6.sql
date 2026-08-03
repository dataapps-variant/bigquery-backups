-- job_id: ba016678-9408-4103-b21d-f8ae2e4c56c6
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:01:27.820000+00:00
-- started: 2026-08-03T13:01:27.928000+00:00
-- ended: 2026-08-03T13:01:28.114000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Daedalus`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
