-- job_id: a562e9d5-f2bb-4388-a757-4f6bbee5a19c
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:10:53.950000+00:00
-- started: 2026-08-03T09:10:54.008000+00:00
-- ended: 2026-08-03T09:10:54.196000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_contractsdotnetllc`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
