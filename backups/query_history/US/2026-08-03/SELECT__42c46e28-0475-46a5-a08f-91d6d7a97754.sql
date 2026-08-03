-- job_id: 42c46e28-0475-46a5-a08f-91d6d7a97754
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:13:06.395000+00:00
-- started: 2026-08-03T09:13:06.511000+00:00
-- ended: 2026-08-03T09:13:06.700000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.VPU`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
