-- job_id: 772eddd7-7c1e-4a83-af5b-368a62b88a2a
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:12:53.579000+00:00
-- started: 2026-08-03T09:12:53.647000+00:00
-- ended: 2026-08-03T09:12:53.810000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Shared_JF_Data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
