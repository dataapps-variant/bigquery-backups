-- job_id: 3935ccaa-6d91-482f-b72e-024cc4ea81dd
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:50:19.468000+00:00
-- started: 2026-08-03T09:50:19.572000+00:00
-- ended: 2026-08-03T09:50:19.832000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Verifications`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
