-- job_id: b3007659-9231-4334-ad2f-2b8de90d5dab
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:29:15.024000+00:00
-- started: 2026-08-03T12:29:15.146000+00:00
-- ended: 2026-08-03T12:29:15.377000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Sticky_Data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
