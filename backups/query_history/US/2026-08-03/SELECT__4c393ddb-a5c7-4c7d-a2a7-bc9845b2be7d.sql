-- job_id: 4c393ddb-a5c7-4c7d-a2a7-bc9845b2be7d
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:05:33.826000+00:00
-- started: 2026-08-03T09:05:33.971000+00:00
-- ended: 2026-08-03T09:05:34.185000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Yahoo_Ads`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
