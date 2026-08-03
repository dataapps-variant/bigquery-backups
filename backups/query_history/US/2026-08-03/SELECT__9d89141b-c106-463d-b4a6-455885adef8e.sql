-- job_id: 9d89141b-c106-463d-b4a6-455885adef8e
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:32:32.869000+00:00
-- started: 2026-08-03T09:32:32.948000+00:00
-- ended: 2026-08-03T09:32:33.225000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.demo_practise`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
