-- job_id: 32ac09c9-e55b-49f8-ae98-0d640b7b0456
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:10:36.391000+00:00
-- started: 2026-08-03T09:10:36.485000+00:00
-- ended: 2026-08-03T09:10:36.715000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Yahoo_Ads`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
