-- job_id: 4eeda5d4-a369-4a26-a53f-ccb70e1ced8c
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:12:20.210000+00:00
-- started: 2026-08-03T09:12:20.332000+00:00
-- ended: 2026-08-03T09:12:20.499000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.CWC`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
