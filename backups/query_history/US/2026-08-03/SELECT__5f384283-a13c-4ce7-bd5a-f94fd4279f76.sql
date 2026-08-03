-- job_id: 5f384283-a13c-4ce7-bd5a-f94fd4279f76
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T12:38:11.859000+00:00
-- started: 2026-08-03T12:38:11.933000+00:00
-- ended: 2026-08-03T12:38:12.091000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Yahoo_Ads`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
