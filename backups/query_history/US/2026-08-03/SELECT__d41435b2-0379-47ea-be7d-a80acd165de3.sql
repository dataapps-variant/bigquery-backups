-- job_id: d41435b2-0379-47ea-be7d-a80acd165de3
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:38:20.873000+00:00
-- started: 2026-08-03T12:38:20.940000+00:00
-- ended: 2026-08-03T12:38:21.089000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.demo_practise`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
