-- job_id: 6f24be35-5e05-493b-ac92-5f5f54eb9a8e
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:10:49.225000+00:00
-- started: 2026-08-03T09:10:49.330000+00:00
-- ended: 2026-08-03T09:10:49.526000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.linkedin_ads_linkedin_ads`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
