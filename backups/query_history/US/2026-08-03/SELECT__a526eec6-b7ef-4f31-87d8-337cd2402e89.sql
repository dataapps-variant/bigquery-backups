-- job_id: a526eec6-b7ef-4f31-87d8-337cd2402e89
-- user: bigquery-backup-bot@variant-finance-data-project.iam.gserviceaccount.com
-- statement_type: SELECT
-- created: 2026-08-03T09:50:11.971000+00:00
-- started: 2026-08-03T09:50:12.041000+00:00
-- ended: 2026-08-03T09:50:12.228000+00:00


            SELECT routine_name, routine_type, ddl
            FROM `variant-finance-data-project.VPU`.INFORMATION_SCHEMA.ROUTINES
            ORDER BY routine_name
