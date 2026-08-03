-- job_id: ed85e91a-2e82-45f0-8c1b-8fce577fe577
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:33.617000+00:00
-- started: 2026-08-03T10:09:33.709000+00:00
-- ended: 2026-08-03T10:09:33.934000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.LMC`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
