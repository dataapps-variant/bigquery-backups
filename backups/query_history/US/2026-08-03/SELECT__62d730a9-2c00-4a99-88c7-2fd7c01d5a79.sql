-- job_id: 62d730a9-2c00-4a99-88c7-2fd7c01d5a79
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:52:53.985000+00:00
-- started: 2026-08-03T11:52:54.074000+00:00
-- ended: 2026-08-03T11:52:54.264000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.demo_practise`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
