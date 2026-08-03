-- job_id: 2e19729d-ec56-4827-a7a1-92fce7d8db83
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:49:06.761000+00:00
-- started: 2026-08-03T09:49:06.873000+00:00
-- ended: 2026-08-03T09:49:07.034000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Facbook_ad_spend_data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
