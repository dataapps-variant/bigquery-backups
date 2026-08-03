-- job_id: a96ed847-fef4-4fcc-b54d-a2f76bc70fe0
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:13:16.230000+00:00
-- started: 2026-08-03T09:13:16.311000+00:00
-- ended: 2026-08-03T09:13:16.483000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.demo_practise`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
