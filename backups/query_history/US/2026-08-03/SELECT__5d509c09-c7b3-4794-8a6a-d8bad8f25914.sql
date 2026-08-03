-- job_id: 5d509c09-c7b3-4794-8a6a-d8bad8f25914
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:29:01.833000+00:00
-- started: 2026-08-03T12:29:01.936000+00:00
-- ended: 2026-08-03T12:29:02.151000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.R100`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
