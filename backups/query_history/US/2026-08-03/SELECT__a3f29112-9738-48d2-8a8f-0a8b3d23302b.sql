-- job_id: a3f29112-9738-48d2-8a8f-0a8b3d23302b
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:32:26.477000+00:00
-- started: 2026-08-03T09:32:26.609000+00:00
-- ended: 2026-08-03T09:32:26.813000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Verifications`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
