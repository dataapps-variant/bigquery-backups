-- job_id: ef6f1221-6803-46ce-9b58-d5a45e01a8d1
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:05:55.866000+00:00
-- started: 2026-08-03T09:05:55.996000+00:00
-- ended: 2026-08-03T09:05:56.181000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.stickio_jobflowllc`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
