-- job_id: 7cf87ae2-0e63-4fdc-b10f-c7b8fbfcbb05
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:33:00.667000+00:00
-- started: 2026-08-03T09:33:00.778000+00:00
-- ended: 2026-08-03T09:33:01.080000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
