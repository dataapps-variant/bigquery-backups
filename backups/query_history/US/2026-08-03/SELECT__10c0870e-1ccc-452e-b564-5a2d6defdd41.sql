-- job_id: 10c0870e-1ccc-452e-b564-5a2d6defdd41
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:29:52.778000+00:00
-- started: 2026-08-03T12:29:52.851000+00:00
-- ended: 2026-08-03T12:29:53.036000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.dim_table`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
