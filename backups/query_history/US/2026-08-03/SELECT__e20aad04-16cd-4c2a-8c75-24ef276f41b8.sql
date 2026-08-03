-- job_id: e20aad04-16cd-4c2a-8c75-24ef276f41b8
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:49:13.266000+00:00
-- started: 2026-08-03T09:49:13.333000+00:00
-- ended: 2026-08-03T09:49:13.988000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.ICARUS_Multi`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
