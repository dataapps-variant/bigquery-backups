-- job_id: d602522b-c90a-48bd-b718-e059f121cfad
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:51:46.136000+00:00
-- started: 2026-08-03T11:51:46.236000+00:00
-- ended: 2026-08-03T11:51:46.410000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.LMC`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
