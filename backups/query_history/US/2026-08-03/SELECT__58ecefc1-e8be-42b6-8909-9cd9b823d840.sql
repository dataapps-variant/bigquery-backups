-- job_id: 58ecefc1-e8be-42b6-8909-9cd9b823d840
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:52:30.513000+00:00
-- started: 2026-08-03T11:52:30.596000+00:00
-- ended: 2026-08-03T11:52:30.777000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Utilities`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
