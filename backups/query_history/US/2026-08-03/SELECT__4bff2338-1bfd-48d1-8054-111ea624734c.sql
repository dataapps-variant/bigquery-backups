-- job_id: 4bff2338-1bfd-48d1-8054-111ea624734c
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:37:18.018000+00:00
-- started: 2026-08-03T12:37:18.137000+00:00
-- ended: 2026-08-03T12:37:18.294000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.LMC`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
