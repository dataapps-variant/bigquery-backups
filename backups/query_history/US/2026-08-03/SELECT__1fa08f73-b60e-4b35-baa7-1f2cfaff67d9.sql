-- job_id: 1fa08f73-b60e-4b35-baa7-1f2cfaff67d9
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:29:37.072000+00:00
-- started: 2026-08-03T12:29:37.156000+00:00
-- ended: 2026-08-03T12:29:37.319000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Verifications`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
