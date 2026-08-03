-- job_id: c4f60dfb-74f5-4082-950f-6e6995711337
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:05:38.823000+00:00
-- started: 2026-08-03T09:05:38.957000+00:00
-- ended: 2026-08-03T09:05:39.331000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.demo_practise`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
