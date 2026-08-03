-- job_id: 879e4052-92cf-4201-8685-6cf456276632
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:08:45.676000+00:00
-- started: 2026-08-03T10:08:45.812000+00:00
-- ended: 2026-08-03T10:08:45.981000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Clicks_Data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
