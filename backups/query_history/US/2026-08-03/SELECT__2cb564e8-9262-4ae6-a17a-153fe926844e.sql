-- job_id: 2cb564e8-9262-4ae6-a17a-153fe926844e
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:12:18.551000+00:00
-- started: 2026-08-03T09:12:18.703000+00:00
-- ended: 2026-08-03T09:12:18.900000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
