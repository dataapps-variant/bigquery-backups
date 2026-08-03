-- job_id: 211aa194-2b89-4d89-82dc-98c612442100
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:32:28.065000+00:00
-- started: 2026-08-03T09:32:28.181000+00:00
-- ended: 2026-08-03T09:32:28.354000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Yahoo_Ads`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
