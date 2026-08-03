-- job_id: a25d9df5-fea2-4299-b32c-e6f7812cc877
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:05:18.648000+00:00
-- started: 2026-08-03T09:05:18.768000+00:00
-- ended: 2026-08-03T09:05:18.964000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Spend_Data_Snapshot`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
