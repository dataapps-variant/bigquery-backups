-- job_id: 04220b80-8a05-47b8-a9b0-712a7a100de4
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:28:02.610000+00:00
-- started: 2026-08-03T12:28:02.712000+00:00
-- ended: 2026-08-03T12:28:03.078000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
