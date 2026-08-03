-- job_id: 49abf765-0f26-49fb-87a5-4cdf99eebba2
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:32:31.238000+00:00
-- started: 2026-08-03T09:32:31.335000+00:00
-- ended: 2026-08-03T09:32:31.504000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.csvdataset`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
