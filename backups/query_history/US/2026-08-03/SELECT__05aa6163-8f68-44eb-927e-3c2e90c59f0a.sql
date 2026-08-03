-- job_id: 05aa6163-8f68-44eb-927e-3c2e90c59f0a
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:04:59.350000+00:00
-- started: 2026-08-03T09:04:59.450000+00:00
-- ended: 2026-08-03T09:05:00.005000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.Icarus_Cohort`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
