-- job_id: 2e1df956-3cb6-4f87-b83f-f43080c57afc
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T11:52:43.826000+00:00
-- started: 2026-08-03T11:52:43.890000+00:00
-- ended: 2026-08-03T11:52:44.121000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Yahoo_Ads`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
