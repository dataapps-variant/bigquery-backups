-- job_id: 8bce8060-a118-48cc-9095-7477d9068294
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:04:41.281000+00:00
-- started: 2026-08-03T09:04:41.417000+00:00
-- ended: 2026-08-03T09:04:41.618000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.CWC`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
