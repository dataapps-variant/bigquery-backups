-- job_id: eff961ae-7465-499e-a07b-be2f637432c5
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:30:39.908000+00:00
-- started: 2026-08-03T12:30:40.140000+00:00
-- ended: 2026-08-03T12:30:40.326000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.vatiant_finance_Google_Query_Snapshots`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
