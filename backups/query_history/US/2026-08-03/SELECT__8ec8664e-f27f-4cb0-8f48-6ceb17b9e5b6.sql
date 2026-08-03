-- job_id: 8ec8664e-f27f-4cb0-8f48-6ceb17b9e5b6
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:02:56.651000+00:00
-- started: 2026-08-03T13:02:56.795000+00:00
-- ended: 2026-08-03T13:02:56.968000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Verifications`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
