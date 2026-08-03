-- job_id: a73ff141-566c-41b4-ad03-837c7170e42d
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:06:07.955000+00:00
-- started: 2026-08-03T09:06:08.036000+00:00
-- ended: 2026-08-03T09:06:08.204000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.vatiant_finance_Google_Query_Test`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
