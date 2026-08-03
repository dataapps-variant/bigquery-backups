-- job_id: 4a6fa098-c365-4ceb-bcdb-c56997ab8ef5
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:01:48.448000+00:00
-- started: 2026-08-03T13:01:48.528000+00:00
-- ended: 2026-08-03T13:01:49.146000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.ICARUS_Multi`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
