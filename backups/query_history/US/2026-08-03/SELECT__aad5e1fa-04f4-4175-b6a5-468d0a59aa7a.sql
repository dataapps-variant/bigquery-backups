-- job_id: aad5e1fa-04f4-4175-b6a5-468d0a59aa7a
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:39:12.775000+00:00
-- started: 2026-08-03T12:39:12.855000+00:00
-- ended: 2026-08-03T12:39:13.026000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
