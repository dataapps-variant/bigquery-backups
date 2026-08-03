-- job_id: 750ae501-f63f-4f5c-b08a-288cb85c6d70
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:37:46.867000+00:00
-- started: 2026-08-03T12:37:46.916000+00:00
-- ended: 2026-08-03T12:37:47.070000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Sticky_Data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
