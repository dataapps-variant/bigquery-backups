-- job_id: 90bba1fb-2a93-4bcb-b70c-147223d2682c
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:10:18.018000+00:00
-- started: 2026-08-03T09:10:18.121000+00:00
-- ended: 2026-08-03T09:10:18.361000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Shared_JF_Data`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
