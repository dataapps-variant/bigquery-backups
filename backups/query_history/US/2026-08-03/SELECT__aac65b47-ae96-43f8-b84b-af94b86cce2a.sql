-- job_id: aac65b47-ae96-43f8-b84b-af94b86cce2a
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T10:09:43.989000+00:00
-- started: 2026-08-03T10:09:44.070000+00:00
-- ended: 2026-08-03T10:09:44.216000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.OpenAI_Ads`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
