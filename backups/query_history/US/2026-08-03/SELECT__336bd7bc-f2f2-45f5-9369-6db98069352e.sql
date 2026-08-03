-- job_id: 336bd7bc-f2f2-45f5-9369-6db98069352e
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:12:58.611000+00:00
-- started: 2026-08-03T09:12:58.712000+00:00
-- ended: 2026-08-03T09:12:58.881000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Sticky_Data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
