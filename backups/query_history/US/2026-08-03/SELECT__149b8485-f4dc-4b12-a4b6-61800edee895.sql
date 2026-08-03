-- job_id: 149b8485-f4dc-4b12-a4b6-61800edee895
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:09:43.294000+00:00
-- started: 2026-08-03T09:09:43.384000+00:00
-- ended: 2026-08-03T09:09:43.609000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
