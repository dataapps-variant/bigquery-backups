-- job_id: 05c62faa-6e90-4bca-9d97-c1f5561d49bf
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:37:59.155000+00:00
-- started: 2026-08-03T12:37:59.231000+00:00
-- ended: 2026-08-03T12:37:59.423000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Utilities`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
