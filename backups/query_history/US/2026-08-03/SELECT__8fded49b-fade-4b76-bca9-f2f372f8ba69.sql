-- job_id: 8fded49b-fade-4b76-bca9-f2f372f8ba69
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T13:01:12.489000+00:00
-- started: 2026-08-03T13:01:12.629000+00:00
-- ended: 2026-08-03T13:01:12.887000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
