-- job_id: 4f2bab77-9a81-4af6-88fd-d4d0ffe2f60d
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:28:46.502000+00:00
-- started: 2026-08-03T12:28:46.602000+00:00
-- ended: 2026-08-03T12:28:46.792000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.LMC`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
