-- job_id: 0998cc4a-be76-46aa-b81a-5f80a6f4cf64
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:05:20.302000+00:00
-- started: 2026-08-03T09:05:20.428000+00:00
-- ended: 2026-08-03T09:05:20.720000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Sticky_Data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
