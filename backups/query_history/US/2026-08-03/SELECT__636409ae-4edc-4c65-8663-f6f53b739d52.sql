-- job_id: 636409ae-4edc-4c65-8663-f6f53b739d52
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:52:16.878000+00:00
-- started: 2026-08-03T11:52:16.990000+00:00
-- ended: 2026-08-03T11:52:17.202000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Sticky_Data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
