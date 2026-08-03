-- job_id: f71fdc77-748f-4828-947b-7b8680277b02
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:53:46.074000+00:00
-- started: 2026-08-03T11:53:46.320000+00:00
-- ended: 2026-08-03T11:53:46.473000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.vatiant_finance_Google_Query_Snapshots`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
