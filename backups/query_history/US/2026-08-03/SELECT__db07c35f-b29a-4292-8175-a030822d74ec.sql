-- job_id: db07c35f-b29a-4292-8175-a030822d74ec
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:04:38.744000+00:00
-- started: 2026-08-03T09:04:39.297000+00:00
-- ended: 2026-08-03T09:04:39.467000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
