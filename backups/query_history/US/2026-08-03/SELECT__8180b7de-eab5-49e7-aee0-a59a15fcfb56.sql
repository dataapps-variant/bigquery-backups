-- job_id: 8180b7de-eab5-49e7-aee0-a59a15fcfb56
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:40.574000+00:00
-- started: 2026-08-03T10:09:40.666000+00:00
-- ended: 2026-08-03T10:09:40.873000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.LMC`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
