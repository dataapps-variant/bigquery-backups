-- job_id: 2c967288-a5ce-4396-8bbc-f10b3365689e
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:29:05.201000+00:00
-- started: 2026-08-03T12:29:05.282000+00:00
-- ended: 2026-08-03T12:29:05.474000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Shared_JF_Data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
