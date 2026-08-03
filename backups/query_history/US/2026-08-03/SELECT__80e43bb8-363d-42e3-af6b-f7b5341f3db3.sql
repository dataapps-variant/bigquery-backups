-- job_id: 80e43bb8-363d-42e3-af6b-f7b5341f3db3
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:10:41.376000+00:00
-- started: 2026-08-03T09:10:41.482000+00:00
-- ended: 2026-08-03T09:10:41.659000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.demo_practise`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
