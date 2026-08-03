-- job_id: 813a496b-a957-4ad5-9b75-d4b1c859b896
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:13:00.201000+00:00
-- started: 2026-08-03T09:13:00.315000+00:00
-- ended: 2026-08-03T09:13:00.498000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Sticky_Data_Snapshots`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
