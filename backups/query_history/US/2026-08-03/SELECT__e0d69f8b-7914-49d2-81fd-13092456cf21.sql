-- job_id: e0d69f8b-7914-49d2-81fd-13092456cf21
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:10:47.766000+00:00
-- started: 2026-08-03T09:10:47.874000+00:00
-- ended: 2026-08-03T09:10:48.040000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.linkedin_ads`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
