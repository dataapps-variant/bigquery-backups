-- job_id: 81db0a97-8e3b-4d81-bf96-12142fbf1b00
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:50:23.755000+00:00
-- started: 2026-08-03T09:50:23.848000+00:00
-- ended: 2026-08-03T09:50:24.044000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Yahoo_Ads`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
