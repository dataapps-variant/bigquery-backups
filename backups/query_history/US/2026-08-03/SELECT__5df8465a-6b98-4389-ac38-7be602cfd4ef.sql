-- job_id: 5df8465a-6b98-4389-ac38-7be602cfd4ef
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:30:04.957000+00:00
-- started: 2026-08-03T12:30:05.063000+00:00
-- ended: 2026-08-03T12:30:05.247000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.linkedin_ads_linkedin_ads`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
